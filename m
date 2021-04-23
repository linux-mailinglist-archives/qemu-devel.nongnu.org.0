Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A03692D1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:16:42 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvfk-0000mh-M5
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvdw-00007O-Am
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:14:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvdt-00083D-QI
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:14:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id c4so9476308wrt.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9xGiO3UK0O+mpz5VDdY42GppyiYCqQePyGApwCVsSRE=;
 b=SqjCL6m8OzFA/5sBTLXaicRCgtKmbTbsXHQ1acpt47LLFLQL0K2hdRXVUt4vuO3g9e
 RTIaLf9wSR9E+hqtHKEPyppcEik5SEv79fhFJt0RirdvW/73rzFWF5XDAAOQ/ULgsyzd
 ZbcISI8xScKbbdqb8C5efVjs3v+Sk76qZQ9MVXs88+U92iOejvK5z5lfM1UlBcs9IwOH
 reUtZXMnRdmOKg+3sHuU54LbjrGkvjcwkH/BrYAwNWdsVSujucHLVlDGC+ToFbLsIyQ4
 MWewiATBknZa7539mnexPQOHG+y3X28k+ua6ecW8ChHONTats3c56tNjUHQymht5bwwa
 +NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9xGiO3UK0O+mpz5VDdY42GppyiYCqQePyGApwCVsSRE=;
 b=Wqu7NdKwN+myZC1IpK+Bis11G5SMTkt81GgAwb1INW0HuNufHfinZSYSdlABYzL0ie
 m1k5CDXfpLwKtK0dS4BrCN72wOpCW0/XCliFPBNl0ABvYXPg1wJR3DkNeK3/fHgxKvTh
 8dFfASu8yeaID3CZ3ChtTcxliCVtOXiw501zvKBGnEcCD8jggSJHgJuyR7iIuWD1yBb3
 TpaVHqJuaT0V6+y79nrZPGv5peLp7AXGsy/UAQngelchavZoWXK4deWoJBFJQMxp3Xs1
 qH/+7efU5xogHKclw3+5pgE2LX9+kO8M3Wq5u5ufywRyNGhGsOw1oXnjySf3yJGiPwhE
 uDkw==
X-Gm-Message-State: AOAM531cIyCJFiPxnRM14vjZtT4rxotNFG1mZcCRaMcu/0Cgvj5QuIq1
 j9g706jOgBJHyTBljYP5i5PNxg==
X-Google-Smtp-Source: ABdhPJy9fTbGuIMNjWoCeAPK4ryjK5rSmiAsV6x9zsRkg6OasFA/vVmjO+vdICRhOCppuwd7S8D+9Q==
X-Received: by 2002:adf:c541:: with SMTP id s1mr4681975wrf.370.1619183684321; 
 Fri, 23 Apr 2021 06:14:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l13sm8999708wrt.14.2021.04.23.06.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 06:14:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C46DE1FF7E;
 Fri, 23 Apr 2021 14:14:42 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/7] linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in
 do_syscall
Date: Fri, 23 Apr 2021 14:14:32 +0100
In-reply-to: <20210422230227.314751-5-richard.henderson@linaro.org>
Message-ID: <87r1j16t31.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not access a field that may not be present.  This will
> become an issue when sharing more code in the next patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

