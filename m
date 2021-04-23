Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6193695AF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:09:39 +0200 (CEST)
Received: from localhost ([::1]:37992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxR4-0007go-KH
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxQK-0007Hc-Kj
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:08:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxQA-0001qI-Dz
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:08:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so1422690wma.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Qls60Hj/TiHpTq+NNfbqiOAre363swwd7AMr8ITNB84=;
 b=W0APHrtUu7U3Ltc6ASafVuH8zGfiXXRerDHNnh9Gug9A/Z9dzr60SbV/6eFLGMoyOW
 vYtEaPmFiJRnnKmI8AcuT2SQOsVscL/gC8kg67oYQhejzr6g9VyRh2qr/XdVZ1VHfPMB
 LymjeplTP9Y/lY+RJCuxz+3UlKDmKBnJCu+JGI7XNT3LoTe8daYM74CyasFrPgWfF8/r
 27l6dMsM2ecrpY+yW3wul9g4cjM4WbRnWfovnH3xgGMniyW8tqQSAcgQCpbsCWDlIG5d
 SWLY0vZofHfTxEgXtlPKFbUOLAAVFCHLVtDhSb22mj/VLiv27AZ+cxq/0puH8XNRdqCT
 EfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Qls60Hj/TiHpTq+NNfbqiOAre363swwd7AMr8ITNB84=;
 b=RvbkAzfIl9lWqmKgh3C5A6xfgApGGMEeli6T6MDnmUM61e9vt8KljpIyfaghZugpTP
 H8jTCUIO7W2zUUBnePTId24rHzgnhnbHJTxGDSRD7I7yLov3jZPMPNM+HhJKtHmqhU1q
 fibquWlytBVKFKfPRjp3EoCXrhWCXUSAUhlF0clFJzEvEHu3/YAyBKivLu/wa5ZD17ry
 xbj1yUnzCPuZLkylgYA8QTyo5wt+6kXOBsbG3Y6I4Ie/XB+EdSPcxLoqsmT83/Iob4h/
 QrX9SOQEdJ7kelYRl4MJX7xeWp39lWTvHS3kbw8wsFXd9SxH06Yy1VEjVvmBeZZv8wIj
 QAhQ==
X-Gm-Message-State: AOAM5326R9rmWUJxP5OMmHCfyW2um9zn6us+TXcplTJxpSWrP1N9qkFL
 1054dXo2zgDwb8E+LMqMeu0Dd5GDTGTt4g==
X-Google-Smtp-Source: ABdhPJyVhlDVRKmpL4lS++wwwjo0OQmden/x9sp4effo/8TyhzN2X88dq7Z+JUw9vQzN21NMyqEvPw==
X-Received: by 2002:a1c:457:: with SMTP id 84mr6057441wme.38.1619190520626;
 Fri, 23 Apr 2021 08:08:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm8963144wml.23.2021.04.23.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:08:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A1D71FF7E;
 Fri, 23 Apr 2021 16:08:39 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 6/7] linux-user/alpha: Share code for
 TARGET_NR_sigaction
Date: Fri, 23 Apr 2021 16:08:28 +0100
In-reply-to: <20210422230227.314751-7-richard.henderson@linaro.org>
Message-ID: <87im4d6nt4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> There's no longer a difference between the alpha code and
> the generic code.
>
> There is a type difference in target_old_sigaction.sa_flags,
> which can be resolved with a very much smaller ifdef, which
> allows us to finish sharing the target_sigaction definition.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

