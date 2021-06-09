Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBF3A1037
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:40:56 +0200 (CEST)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvdm-00033p-Ul
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvcP-0002My-N7
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:39:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvcO-0002oI-1h
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:39:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id a20so24978610wrc.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tyTCp5DIVEV4lhmePAadKnTmM/6tpb1VNDQdhc5kXcw=;
 b=G5B+bUDWZb2Zfj0LPrFwWXCeWbgjFiqnGzHg9pFaiTE4H/yNx0qRFB/sTsl6B/YuPE
 WXJNhjwvpZh6NRDjD98C7V9VT5TIIEW7Z/8HAtz+YtJYCyXqnLWG6s8TWJmq+ckYNIFJ
 5hUxI4u2T+mJ44CzMnfLKKpAoU80iVKxqH7aXgJeiivalYmpl2oUEUrCDLOJybA8krQ/
 SepeOu/5x24fnyhHAtzw2ZkbR64mfoIEE6mJwe+rYUcWkXfwVsaaEaIvRzVTfjV+ATgl
 ebv3vRggg2VLvwoc5Al2VdTl0T3AQnhYGFsFugbjjaX/IGkOR7i261C7xCjrNCYz+p47
 6hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tyTCp5DIVEV4lhmePAadKnTmM/6tpb1VNDQdhc5kXcw=;
 b=Ef47ab12XIsgjjhzul4q1yamXG8XsSfAl3YPJog2NtFlvLWPEjlKerVZaZLrJEjd6q
 aFciGFI59HKZF/Nvl7ksFX3sl4+5XrilNhDClb4I53N50NC0QRLszZjwU1PrUdZbJZKf
 q8kpBkIn5Wl5BioLANk/O2LMcbsSHOLnm2nuznrmfaWbxqYBZYQ7dA/gg6DcCj25g8J5
 us0osYjmD/QN7SXqZWuchS8Shss0W7fH3+Tn1WvEp6EOeusEg1+AIwOQEmdxZF0Z8tYF
 BP0XpbBYTqru01EffYKFIPN6lr1DA6/5ZNtoCG2gRL16GyTzXSHvIuXIdFqeFDUO33zn
 lxfQ==
X-Gm-Message-State: AOAM533ztmOqfQRYcDYwdLg2sx5592DygOYXNWdWALzkYyKSnp6F+JiU
 6wPBAaNZNXHQ7+Xpg+cGhF12a0wjqBCV+A==
X-Google-Smtp-Source: ABdhPJw4oIaAwugFqt1FQ62L4CkKcgfYlyzi/6MS4FA47Rdi6Tc2PPCf5HKnUdAJkfKilfl7B8U8/Q==
X-Received: by 2002:adf:906a:: with SMTP id h97mr28103813wrh.311.1623235166272; 
 Wed, 09 Jun 2021 03:39:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v17sm15823683wrp.36.2021.06.09.03.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:39:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F0D791FF7E;
 Wed,  9 Jun 2021 11:39:24 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-27-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 26/28] tcg: Merge buffer protection and guard page
 protection
Date: Wed, 09 Jun 2021 11:39:20 +0100
In-reply-to: <20210502231844.1977630-27-richard.henderson@linaro.org>
Message-ID: <878s3jjp9f.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not handle protections on a case-by-case basis in the
> various alloc_code_gen_buffer instances; do it within a
> single loop in tcg_region_init.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

