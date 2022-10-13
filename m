Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA45FD819
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:07:14 +0200 (CEST)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiw3U-00080D-Mv
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oivh3-0007eJ-I4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oivgz-0001Jt-BC
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665657836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yq8Q4y4q/q87WLbcimv53k6y6KcYVjMYZuuuKuYo7Rg=;
 b=Pa72WesrjB2/lz/TreVfiAqzZpfuV2vhnPAHJ6Pqt16/3UyRwwQ0EWmT/GPqZ74H7sXTzW
 Fv5936qBTQtBCXtNPzEhqEnHKWzaixDTLiU8UEpxGeAp9G02T/kRiD4RAjxHREAsZb4jst
 he7GRMrGAcVdfEZiho4kt2z6bIv5X38=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-Z1uBYqHCPmWJhtzREHCITg-1; Thu, 13 Oct 2022 06:43:55 -0400
X-MC-Unique: Z1uBYqHCPmWJhtzREHCITg-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz21-20020a0564021d5500b004599f697666so1186638edb.18
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 03:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yq8Q4y4q/q87WLbcimv53k6y6KcYVjMYZuuuKuYo7Rg=;
 b=viUjqB2n0kq2QufSVHYuW78twwHjC3NjCq0Wl95ou1kwWQFxdRNV9eMhRBbT/rCgDt
 a/JPUdK/NON9GbZuLVZ6sBKFinNABEk8q8dIR9Y/9AjPCbvLffmb6EXx42UzFiiwFgAn
 wdc9XuvVtVBkPFjXg4uUe2POhup38JK4mwCpwzIRGcarRSwUvL2nP8IkWK0Rn17ZDTUY
 2GK3S/EX2qxg2qXeKBvA1bCXiBRDHySUBZn6Z2Yqj8Wq4c+0duomd3A1bqE/d8Ax9IUZ
 oM71budcTcp2Ix3ioRED0R/kf7jJu/kP62K9NhcXofF/H2kigv82uCu25NiWG42wiYna
 vMCA==
X-Gm-Message-State: ACrzQf3vrep8kl63BS6GkKjThBqwyH9Wg9ggkz6XpY/E4RB0y0N1+Ytn
 pVpx1KjE60uHKqkjmtLCqkJANS7OFR5U9XSL0pHoNcxTUqUtm0gO0mEyqYLp9QdMr8hn0FjpEST
 7jJkqrS3P5Cx42pc=
X-Received: by 2002:a05:6402:3483:b0:45c:c7e9:897c with SMTP id
 v3-20020a056402348300b0045cc7e9897cmr4770783edc.406.1665657834145; 
 Thu, 13 Oct 2022 03:43:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7etYtrhq05RiJT6PhAbhXRIJhm7mCE9o/fr+QG3ELFc3jyXmwYhDaA8KbnUllZeGqdXs+Dqg==
X-Received: by 2002:a05:6402:3483:b0:45c:c7e9:897c with SMTP id
 v3-20020a056402348300b0045cc7e9897cmr4770772edc.406.1665657833946; 
 Thu, 13 Oct 2022 03:43:53 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 gr24-20020a170906e2d800b007815c3e95f6sm2838182ejb.146.2022.10.13.03.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 03:43:53 -0700 (PDT)
Message-ID: <4f96fe6a-0fd4-0985-5626-b54ba15d20ec@redhat.com>
Date: Thu, 13 Oct 2022 12:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] configure: Avoid using strings binary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
 <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/13/22 12:39, Peter Maydell wrote:
> On Thu, 13 Oct 2022 at 09:47, Michal Privoznik <mprivozn@redhat.com> wrote:
>>
>> When determining the endiandness of the target architecture we're
>> building for a small program is compiled, which in an obfuscated
>> way declares two strings. Then, we look which string is in
>> correct order (using strings binary) and deduct the endiandness.
>> But using the strings binary is problematic, because it's part of
>> toolchain (strings is just a symlink to
>> x86_64-pc-linux-gnu-strings or llvm-strings). And when
>> (cross-)compiling, it requires users to set the symlink to the
>> correct toolchain.
>>
>> Fortunately, we have a better alternative anyways. Since we
>> require either clang or gcc we can rely on macros they declare.
>>
>> Bug: https://bugs.gentoo.org/876933
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> 
> If we can determine this just by looking at C macros, does
> this really need to be a configure test at all ? Paolo?

Yes, because we're using this information to generate a file for meson
that's later used during cross compilation.

Michal


