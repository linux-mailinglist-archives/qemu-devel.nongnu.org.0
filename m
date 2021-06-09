Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8023A102E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:38:37 +0200 (CEST)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvbY-0000b8-Iy
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvZZ-0007Rc-Qx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:36:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvZY-0001Kf-83
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:36:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id c9so16219681wrt.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5sFPadCt1/ru7QmpwAYq/6bCWRss54kGo0AzROzVFOs=;
 b=KGV/FMJMWhFvwSqaV2VONGGr3BI7NYOCFZcXftAeyFcfAgs3/9GocEzYWDfsC/M4dG
 iEfzzhoje32zN11EH6d6zDeCTN3ZzlNICQbwdQeU9J7QjGJOZXsPE3FIC4p4hL9Zqtro
 EqHHnJO82qsL/Cb6d0V9nh/P68wQ/TUJmqKPsneirHSIMEiZqtkliGlsBdBoJuu1PmlD
 K2tPZnPT41f27vOUNtPzxRE65B0cbpWyW106WfETEptNG1Fkq0AeE4p1MqgJz2/UMaYR
 fif1VGzySG0DSf5Kd4n1LbHXRE5VGGWUT91hZ255qBq6P9xWldYL6FSJTshpgxWg5oUn
 3ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5sFPadCt1/ru7QmpwAYq/6bCWRss54kGo0AzROzVFOs=;
 b=iC+6sCZTeCLHVOH6ICivUGm2feqt1hkWtM3ioQ+UXO6P8YeTUuQsQgIqSkIpF/vvpF
 CCmgIwGJWxncQxXKppDD7xGoSmM1CZAmxBOQW1PQrYHVbfaENUfOg3r7G36TZSm+WVGD
 eiantjCIQr4S1gJU80M+7RbYbFTqnnKjh90iMKN8mItQaQ+EUmztORrHhNMyYPyMiDcs
 5NfbXo9hrI1xBV+ffpjxT7xeWnxMawrBV1Gl85MnRE01Mry1i5vCSspSYV2IPQz7wiEg
 1QyoQWsyfceZkxLZ4w9LenrRLUwOVmymENKwPC1QffVjq8Zj5beHKVTVQPDT9ARPVgmL
 j2hQ==
X-Gm-Message-State: AOAM530qZVliwwu8148w3ucptz8WjVmzcN3Lg9hm5loh00bVvHP0BnFb
 ENLXLXH3NNTQLI9SSam2DMMxPQ==
X-Google-Smtp-Source: ABdhPJzBsAYxeynQGWzZTW+d8XOfEH0bsOyKfelNwAfNW5Dy2He1sRoCztRofTTnhzVTOTw3XvOJGg==
X-Received: by 2002:a5d:58f6:: with SMTP id f22mr26996880wrd.128.1623234990880; 
 Wed, 09 Jun 2021 03:36:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n42sm5613656wms.29.2021.06.09.03.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:36:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 864631FF7E;
 Wed,  9 Jun 2021 11:36:28 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-26-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 25/28] tcg: Round the tb_size default from
 qemu_get_host_physmem
Date: Wed, 09 Jun 2021 11:36:23 +0100
In-reply-to: <20210502231844.1977630-26-richard.henderson@linaro.org>
Message-ID: <87bl8fjpeb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> If qemu_get_host_physmem returns an odd number of pages,
> then physmem / 8 will not be a multiple of the page size.
>
> The following was observed on a gitlab runner:
>
> ERROR qtest-arm/boot-serial-test - Bail out!
> ERROR:../util/osdep.c:80:qemu_mprotect__osdep: \
>   assertion failed: (!(size & ~qemu_real_host_page_mask))
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

