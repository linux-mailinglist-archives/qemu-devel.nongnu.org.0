Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DC1DB943
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 18:26:33 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbRY8-0001BX-FR
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 12:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbRXG-0000Qc-Kn
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:25:38 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbRXF-0000gE-Gl
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:25:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id s19so3683815edt.12
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6yR7iiGwb1V6ctqlVjJBaS9b64Rvh8x5NO5AnfD/1Vw=;
 b=VZmbZlOFhtwPmuMQh28TDfdIBsEw+/duLbikrSFmJ805mRpI2Ys14Vn1XbCrDiWavv
 BcmXGSVzC8FX/x/oryzuniW1aQG0co9iCfBljf1DY9/1fy2njaDa4wJhXhbC0zfBYNeF
 Cdb6S9tV2g9M0vq1hZKDs6vaGMUqWYpLkmqN0UwLvft2rNEN6oHRmCY8rUsmf2XnQKgn
 nitCwBArxGLvw77c09NuqkQ+i0fMHF8tGCS/Fj5q26wsXHbW9yMynKuZ3gTUA/X1chh9
 8hcr4ljouguVpiC69Ovxn6o4cSY77iUUhTjNiA1Vg90LbgcbsY6/LgPH+QVYE/dXlNkG
 oiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6yR7iiGwb1V6ctqlVjJBaS9b64Rvh8x5NO5AnfD/1Vw=;
 b=G7OegQJQG5jnHLYmuk/juUzwrYyU0BPhJzhau7YQJn2Z/FLVdHpyqE0FkIwqIitsBk
 Km7kEAFsTfJEMbyxOC6UUnoHKnAHe8Nnm/9WwukjiwgPTluX+CisUZV7A/lHDA+oPdhz
 hBxw8SXXVxWLN/rEaneImeESZjf3IMaeTpboR/y4JhdGPnYdpYwuQobtRD/nP5kL/X/4
 wwCTFcxKnVh81MhYFwJw5p6se+dMHSPE+8MMPOAHye/rTJTzGyCRWVYu2hz9S0zYWZM0
 Adwa6MEglaff5apD03BUaZvKhwUXw+WsXja/PhxqONKXbbcAmuTO8ZI4O3/OCv1Fgd8f
 +jnA==
X-Gm-Message-State: AOAM532TSZ5TcpgM4ZQl/IHaPhZTCf4jSGLyiIKh67LO9BwLzpQ1UsYQ
 6e0SoWxA1z0xxRoNnZ4t3Evb6Q==
X-Google-Smtp-Source: ABdhPJw/pjEDlpSIKLPwwKG/2b8G5JJHgv14AlBKSHLde63S2aVQmaODkiO/eanMWzaxKu3mC9QCKg==
X-Received: by 2002:a50:ee15:: with SMTP id g21mr4035496eds.170.1589991936001; 
 Wed, 20 May 2020 09:25:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id se2sm2302578ejb.42.2020.05.20.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 09:25:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3C231FF7E;
 Wed, 20 May 2020 17:25:33 +0100 (BST)
References: <20200519025355.4420-1-richard.henderson@linaro.org>
 <20200519025355.4420-14-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RISU v2 13/17] Split RES_MISMATCH for registers and memory
In-reply-to: <20200519025355.4420-14-richard.henderson@linaro.org>
Date: Wed, 20 May 2020 17:25:33 +0100
Message-ID: <87y2pmfu9u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> By remembering the specific comparison that failed, we do not
> have to try again when it comes time to report.  This makes
> the mem_used flag redundant.  Also, packet_mismatch is now
> redundant with RES_BAD_IO.
>
> This means that the only thing that report_match_status does
> is to report on register status, so rename to report_mismatch_reg.
> Also, we know there is a failure, so don't return a status from
> the report.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

