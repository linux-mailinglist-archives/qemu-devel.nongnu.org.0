Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354839E2E3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:32:10 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIAa-0008Os-LZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI9C-0007dl-M0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:30:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI96-0005PP-Pj
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:30:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id h8so18333672wrz.8
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wjbx1VaY5rzedUXOgLfxkomIoiI6TZA+etmDnNHIK1I=;
 b=S9MIgzSsBWxRP6IOvew3XiN+bpoqE7CPMnwYQf/jX67JU6odbEGQMl1teYVgMOdKtn
 qdqkbobj3xDdasQyUHZCE9gmJOiHFpFZS32nqd4Hh9vRZHL6sroEvaIfBoKpomJYsbF1
 NSX0Acmz+6nQpUCmU5ku311dVzHoaSeUf//wlc1jKakrfg56/XlhWPyXlSSjWf9tuypm
 U0DDZPrc+FBCaf4QC5yUSU7sXyD+NYQsGfukCuaDXfkYBKuEOwsN4vIjMWeYsCLilOuG
 CypmD3u94C0bEZYKqqB20VbBC2ZD40ZtcmXDyewwObv74ESTzFNJM2VezNkneTc8y4ty
 LGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wjbx1VaY5rzedUXOgLfxkomIoiI6TZA+etmDnNHIK1I=;
 b=jbcC7MMo5J/CCsVF9/us6YXgRkSmBWXwi46raErRkEa2920VljN8R7KitvXTPfnmdK
 0N+ZJ3u/EHua4hfceeyLci0EXWsc1EwZribitYHMZ/TzgmvXG4TB64lGxO0RBrNGquEM
 nhh6ENwvv5YaIaP/+glS8NNuuVU04P4zihmhBKnuxBWsGT6R0OLlt7btn+WEcEinPRF5
 xJ68vbJgqD800wxFG+2GkLUubrNhO5r+H2cxjBRgWzBL7ld5o118wtU7+XSocyCO1MH1
 hU1LD9zrnqpnHL6aK71y2GazZrPerzUXMy/7t0a3BGQanhqyFbnoUYbcwDnQnKqWDBAE
 b81w==
X-Gm-Message-State: AOAM531Dxm6wDGdLtsP5m3EDkDIR4FEWJdGRGB9XCQ6/3w2FoMhKsfS6
 RG8goMpsZe0HFTjN5KLLO2Uxiw==
X-Google-Smtp-Source: ABdhPJzeqOT6oIvk0l9IJB2CgBvbJ8kXjeWk6zrZ7BkfCVN5S07rngj/pgSTD2jUmPxdElP9XpmW9Q==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr17971265wrt.133.1623083435317; 
 Mon, 07 Jun 2021 09:30:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm16646909wrs.23.2021.06.07.09.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:30:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93ACC1FF7E;
 Mon,  7 Jun 2021 17:30:33 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/11] softfloat: Introduce float_flag_result_denormal
Date: Mon, 07 Jun 2021 17:30:21 +0100
In-reply-to: <20210527041405.391567-5-richard.henderson@linaro.org>
Message-ID: <87v96pmyc6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a new exception flag for reporting output denormals
> that are not flushed to zero.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

