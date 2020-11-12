Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800AE2B0CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:40:26 +0100 (CET)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHWD-0003i2-GR
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHOa-00041J-Uo
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHOZ-0004Jv-CW
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id d142so6123625wmd.4
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=SNbuV0wt91VaBGTMnCMKwWiN017FNVYSS3gBUd+cisU=;
 b=MdoQtDCCTkuYBoIYW3paM4qBThBUdPyuw08q32SiTyS1irfn0jF1MLqdcW27ahDvpn
 LTd0yPmsdtmZiexa3p+TgsYWEeCp4zl7LEDVOGnQmBrJvHDypJUK8QwAXp518c77Izae
 FMYc9TX/+1oe4w8+J3sq5EiimxZRJmOqhpPb0wj4d4O2rapD1WzBFNDle1kxGbrDmuXD
 hF+KqV7JqILk9VeNNoGIKwJWp/xAACGmGuffgp9An8FSAbENfwsc1CEabYSxWURQ8FMh
 OMxpIkZ0UgPBqEJuHVWFCunznBML72p19laWdQh0ewuAApsi2omGNus5GLuKaC2WmRbm
 O0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=SNbuV0wt91VaBGTMnCMKwWiN017FNVYSS3gBUd+cisU=;
 b=bbtYdxFeBYZB2e3RsLGdCs/EGrDZBjYpNgDJFbmFsqdccgXQ76gnhonkIMeIerQqba
 4MLBkhGualVpzEN+/zc5tRqVxm2BQfpyws9Jo31yJvr38hyY6Js4n/Gqt2j7AhX5Jr8f
 sw8iNihIULD+0DBF9jH8cj5krCC8QHDpsM2xhNuN+HeRKEXp1OyQLCm0Y3P9gFBscaq/
 5Ip7/LMf2faf5yQPhJ4cgLUK3bhiLPw0/jO2paOgpKcjjeTXpUmW4REwVLFIE9DX76Lt
 WqclxWas36+rv2mIVjEGDzEWcGc3sNTIOQKXyiXa/Z0GckPqa343Vp/yfqgqL+i5TT6p
 KyXg==
X-Gm-Message-State: AOAM532il3Rn17ANvqsu0T+L5fmJRLXhu7nfIzzEacihmyWGsbEW1zNy
 N3rPh4tysrYGWXDY6ZZ6KfBhbg==
X-Google-Smtp-Source: ABdhPJznlxYhSxeiASrtbJp/uAVh25NvZgOz/782AAhT4DmF9CeVhFHjwQ0Z3spZJgVSjKxyzqW/hw==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr894504wmb.157.1605205949909; 
 Thu, 12 Nov 2020 10:32:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x63sm7970546wmb.48.2020.11.12.10.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:32:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 431CF1FF7E;
 Thu, 12 Nov 2020 18:32:28 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-9-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 8/9] docs: Split qemu-pr-helper documentation into
 tools manual
In-reply-to: <20201112144041.32278-9-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:32:28 +0000
Message-ID: <87mtzm5sub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Split the documentation of the qemu-pr-helper binary into the tools
> manual, and give it a manpage like our other standalone executables.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

