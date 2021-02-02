Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D930C2C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:00:04 +0100 (CET)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x9v-00067l-8G
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6wrd-0000K3-LQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6wrb-0000dp-TL
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id m2so2708878wmm.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=D/I/jrcEQvE7eRaudp5cZPIuddBo7bIvAFQswxBQJxg=;
 b=UuNca/3lJug7PP90hIMVHy7+TiyBkqxL7StZe9Ilhd9aOsPbLQ3FSuygAs6UloGzQk
 ghKU9prXMkPF4eoM6Cj9WHKXMjNjWWYCq4sSbOT1XfsgALKQ0ZFuFOwlaa8FL4Cwm9Y6
 Fue7awCiKgVNPHsWnD1j5BOUR2viKJuGV2iwfeBX0PC9f2yCdbYbatCYlWi7pAhXP3aC
 VXsT84YwAd+VVPU9OXKpcA3uXI3maefJjPM+wDrUB5j15xtrM7PGYIavLWU3Jum1g6Jq
 P3in5D46ZT6TR6hmVW7kIspibh9KIRByHKj9ZhFyzlGAtW/Dq19mo0vrpcjwDFcORcU6
 x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=D/I/jrcEQvE7eRaudp5cZPIuddBo7bIvAFQswxBQJxg=;
 b=SqgTM62NtHBIAx8az8x8MUAvvvUf0VPdw3DBtMYDbD3ceLfCP2XVR8Vz3vMJNxd6fn
 aonpqw2dc6Alw+ESl5yYb93xJKTrSP92xdwTDUkCV9iV/lOBMkRQcBRUvjhzxlw1oVUQ
 wUW6K/LtQSEhFLrTKR+2MIcihbkYdu9C/GklGohUNUPqVTkXKvSyZhkP2PWcxiQpNo0s
 vwVsaZBpLDHq5ZrNy0XFuzaDu81Sb2kBIPyQ+msKbiRqKXL+h7CHvDWUQ9Mm/LC6gRfs
 WzUtdfbxzKMGnq4SLPBaN+tlfutBNm2NHImSejO7xyMhQSgV9KVlrlB//lajvNbrKTUz
 An5A==
X-Gm-Message-State: AOAM530GIn+kQZRc7UhieaHRLoolvquxABlRqC0Uf904MKoPsbXWACXM
 XPyb2FHP45unMfphIk9qd/op/A==
X-Google-Smtp-Source: ABdhPJzBYKi5TJ3C4kI6jIyptnx/weCCmDbdXumtIMXwl4aRk+g6Kz6TNfop5eHggCbSKojeLeYm5Q==
X-Received: by 2002:a1c:8157:: with SMTP id c84mr4058382wmd.24.1612276864833; 
 Tue, 02 Feb 2021 06:41:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p18sm3341833wmc.31.2021.02.02.06.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 06:41:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 201821FF7E;
 Tue,  2 Feb 2021 14:41:03 +0000 (GMT)
References: <20210118031004.1662363-1-zhouyang789@huawei.com>
 <eac694c8-b9f6-55fa-d32c-3f7213b24e8e@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "zhouyang (T)" <zhouyang789@huawei.com>
Subject: Re: [PATCH v3 0/5] Fix some style problems in contrib
Date: Tue, 02 Feb 2021 14:40:29 +0000
In-reply-to: <eac694c8-b9f6-55fa-d32c-3f7213b24e8e@huawei.com>
Message-ID: <87bld2ttvl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: alex.chen@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


zhouyang (T) <zhouyang789@huawei.com> writes:

> kindly ping,
> the link of this patch set
> is:http://patchwork.ozlabs.org/project/qemu-devel/cover/20210118031004.16=
62363-1-zhouyang789@huawei.com/

Queued to plugins/next, thanks.

(I might as well pick-up the ivshmem-server change while I'm at it as
it's trivial).

>
>
> On 2021/1/18 11:09, zhouyang wrote:
>> v3 -> v2
>> add Cc=20
>>=20
>> zhouyang (5):
>>   contrib: Don't use '#' flag of printf format
>>   contrib: Fix some code style problems, ERROR: "foo * bar" should be
>>     "foo *bar"
>>   contrib: Add spaces around operator
>>   contrib: space required after that ','
>>   contrib: Open brace '{' following struct go on the same line
>>=20
>>  contrib/ivshmem-server/main.c |  2 +-
>>  contrib/plugins/hotblocks.c   |  2 +-
>>  contrib/plugins/hotpages.c    |  2 +-
>>  contrib/plugins/howvec.c      | 19 +++++++++----------
>>  contrib/plugins/lockstep.c    |  6 +++---
>>  5 files changed, 15 insertions(+), 16 deletions(-)
>>=20


--=20
Alex Benn=C3=A9e

