Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CF39E2E0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:30:06 +0200 (CEST)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqI8b-0006g9-9I
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI7U-0005yv-J4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:28:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI7R-0004S6-Io
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:28:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id l2so18362959wrw.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9KusYLifo12Ku23BZt1UMcNw60du6duvQLjSlXkgr6g=;
 b=F/1k42dgDV5I7B7vijyH2VrgPwsOsz3elcDKPRXQ5U0AhtdcNuYcmp2TeGhqFFOQdS
 ORoXb29r6e8RpTkvV+2bNqUT00zC0cNj07iU8lgMV/jQp+SR/YqvGagsvZ4iYzel9mZ3
 +hNdP+jrd4uwpKWqHRDdobE5ENEYbhKn3gJXhaR1Fy+Zcv1V9Bj95XewlxButOR/0W4M
 ChVZ10ByQ3pEWFUxUfcmkLJT0vywArU4ihJTYRETDRjoNr1V/5VyQOAGQl9kFhbqqz9w
 NNRY/b6Yzi7wJcwRzI0wacezzrSMcSvrSwvKxaw33A9AGT0jD28Rmlp1nyzxtPKhihRK
 +ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9KusYLifo12Ku23BZt1UMcNw60du6duvQLjSlXkgr6g=;
 b=Nbm4QVGKnuz79CUaW7jkzslTP6WJOvRnbi7JcAA30ipAjKJx41KXie2jElo0qozad9
 71Dtz3cf02wq/S7qEd/rQ4P+uQApLB+tODo9qbTzjT45tC5GU4LtwAK/HGXaVy3B2uby
 GiXeeq3TMOT0QObef0/tP+kFP54e4vtynFCLHd4/dGxMY3tEobLjzMj/HzbpU7EQRqW7
 uLRGXIe5aidQBCuiBRA1pX+7hcJ5WegvNkU8XkkDq2jm8P+oLoP5dKul+5uds2rr+ILw
 U8HEOrTRH+pQnuMN863D6Dayc2QFvNpXoRSg1KclhXCebyMo3Oasv57/ojTwml04yH8C
 QFWg==
X-Gm-Message-State: AOAM533bNUqbol8NPFlMAkzH24ORUOYnKpSczKTnOLx3euVUZK1qP1DG
 TlupgkZToXt7kBDEbQRIa0S01w==
X-Google-Smtp-Source: ABdhPJwNbtWH0SffwT8b6pi8K6LBBkXShC/a8YI3fLG3ANB8/cRnL0Poo2pzl7s/Y+ctflmPJpImmQ==
X-Received: by 2002:adf:f5c9:: with SMTP id k9mr17291532wrp.180.1623083332144; 
 Mon, 07 Jun 2021 09:28:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m23sm226913wms.2.2021.06.07.09.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:28:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FD001FF7E;
 Mon,  7 Jun 2021 17:28:50 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <871r9dod1w.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Date: Mon, 07 Jun 2021 17:28:33 +0100
In-reply-to: <871r9dod1w.fsf@linaro.org>
Message-ID: <87y2blmyf1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> Create a new exception flag for reporting input denormals that are not
>> flushed to zero, they are normalized and treated as normal numbers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
<snip>
>
> Anyway other than that observation seems OK to me:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I of course meant:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

