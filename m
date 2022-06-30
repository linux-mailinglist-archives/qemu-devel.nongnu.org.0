Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324D561B41
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:25:34 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uAm-0002lp-Nj
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6u4D-0005ks-Kq
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6u49-0004Yk-6w
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656595116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2nYnaXJFRHRGRzDP+R2nRHWdwAKHQDH4HKPV74ii3s=;
 b=R/KYRaO7RNN+IL+6NoO8gSlvLxpE3nFnMWLsDo15kQsT4BSFRHYG3MKE14M2GGQf9a2b+L
 xtopgW0JpAx4DwM4misp4i++pKEIEOcNIMCVoJZspoVlXhLGEy9RoBtFECwO5C5falyFxT
 JIEo5f7pJU21d+g/Tln4zmoCkjKIRTo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-KA1XRXnzPjWiih9XiHPJKA-1; Thu, 30 Jun 2022 09:18:34 -0400
X-MC-Unique: KA1XRXnzPjWiih9XiHPJKA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z17-20020a05640235d100b0043762b1e1e3so12918262edc.21
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 06:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c2nYnaXJFRHRGRzDP+R2nRHWdwAKHQDH4HKPV74ii3s=;
 b=4c7euhteQ6I5p/4H+wHrQmbTl/hShlw+LnTpz4df9O7747X0okFpIzF5hGypEO/Pr7
 qnjhdAHAOJXSut54sfCYC45TypXg8DJU870EsfA9zuoFglwRqCfuZasXj9/YEEs397sZ
 AWhJ8pbmOl0rB7Ye0d2QFV5DcPeqP89bey3I6VGjpIjCnbWW5BucxLLYKXJcxEpkadF+
 pLvsfp7y+fxUjTl1PUEu154R+gDpMYiK1NnqBSTXnSPeHFFkp7NX0ggQkdgX/5EY4Yex
 nFEFdNdA2j4F4nHpDBSCBtQ6pTKP+nzMoAKj/Z4RGFozHRVK1pxPEMJkxuMhRohQwOoP
 EZ8Q==
X-Gm-Message-State: AJIora/r6exVtOI6caR3t4NGHLGhzZ8DWYkA7A2LJvHdQTigH9fTb48J
 V1dD83oa7pmgfeSSkhcd9EnG3yJnfTzhbE1qAcX3CEgeb/tsssTLkeiBEsgOV3fKOHNWSTJmT+R
 TP2UleHjd71AhXcg=
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id
 q12-20020a056402248c00b00437afe7818bmr11345708eda.239.1656595113198; 
 Thu, 30 Jun 2022 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZ4yjeX+Qnb46V0lwOL/uLmXSYVhr9qp/LyElTv4sZ6vgG1KytpotY7t6WuoUJHcIdBS2NoA==
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id
 q12-20020a056402248c00b00437afe7818bmr11345664eda.239.1656595112823; 
 Thu, 30 Jun 2022 06:18:32 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 24-20020a170906329800b00722f2a0944fsm1250191ejw.107.2022.06.30.06.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 06:18:32 -0700 (PDT)
Message-ID: <ef7a6772-6e66-2292-0172-44e212a15100@redhat.com>
Date: Thu, 30 Jun 2022 15:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 00/15] block: cleanup backing and file handling
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> That's the first part of
> "[PATCH v5 00/45] Transactional block-graph modifying API",
> updated and almost reviewed.
>
> On commit (15) is added to original scope of
> "block: cleanup backing and file handling", as it's related.
>
> 01: add Hanna's r-b
> 02: - mention snapshot-access in commit msg
>      - return ret in compress_open instead of EINVAL
>      - add Hanna's r-b
> 03: add Hanna's r-b
> 04: - add case in commit msg
>      - fix comments
> 05: - fix type in commit msg
>      - add Hanna's r-b
> 06: add Hanna's r-b
> 07: wording improvements
> 08: - fix wording
>      - add Hanna's r-b
>
> 09: I add the description, whey we allow a degradation. Still,
>      up to maintainers: it's OK to merge 09-13 into one bit commit
>
> 13: - fix s/|/||/
>      - improve comment
>      - more readable logic when handle filters in bdrv_child_cb_attach()
>      - don't keep **child indirection, move to just returning a child ptr
>        (honestly, I didn't analyze all the callers do they need this int value. Do you think it's needed?)
>      - handle snapshot-access.c
> 14: get rid of _ptr
> 15: update comment

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Patch 2 needs to be rebased on 79ef0cebb5694411e7452f0cf15c4bd170c7f2d6, 
but that should be straightforward.


