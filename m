Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787139B90F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 14:32:33 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp903-00010X-Qc
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 08:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp8yr-00083B-25
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp8yl-0006IT-I2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622809868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lG7dSREqElH8jKVOiQUlSy/RFN2E+0RLk/qq3ZkRJrM=;
 b=OOyZPYLuc2hsDxO5YbA7X7363btE1wSexPHxSCE/ifx8UyPM5Of57dmSaAsRGr+UHE9vdF
 WYlHiZhkU4eCOmXloxKZiHQwUxspOSJeAt8jMGkU2nmFtxyS33UxdlkMU+XezusFs2mbMq
 y/2W2/NH4JXO8E1J6TSAYfPDFeknQ4c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-CobCpeOsODynZ4vlovVjqA-1; Fri, 04 Jun 2021 08:31:06 -0400
X-MC-Unique: CobCpeOsODynZ4vlovVjqA-1
Received: by mail-pf1-f199.google.com with SMTP id
 j206-20020a6280d70000b02902e9e02e1654so5323171pfd.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 05:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lG7dSREqElH8jKVOiQUlSy/RFN2E+0RLk/qq3ZkRJrM=;
 b=RAk3OScB++qSS6d7tBPI7b1QAF/JVJUXvFixX34nsBpLiRJeJQ2VDXDnSx1HI92jdC
 v15wxjxDEVLhuLm2ejNiJhmzCyyiUR3FNBrMVUCwgJM620doRfwli8GmLW3cp/dtzErq
 5INO31atktZcHLaEL0lV39dCRzrY8MIV32e3R687bf365sAHQaQJgl1QRYZdIHmyh8nP
 JLbE9y52SAtiDoIsr+vGj6vzHvLTmS220cPtrgw52EWWA0VVd8C6qmvchdrh7iuctp/8
 u+BlGFW3Dgm+8F52cbOhYHGpK7TOKxFNBbByer5Db1fMDDvPrgOPVH4fjpWJIXeoX6i0
 SaKg==
X-Gm-Message-State: AOAM530X6FV565Af7+nlvDSKe60oL9/+rjqP6Z+znaExCbbaKYQaGo07
 OALkXBvOeCg3M4hnRL9It98djIfyg8ssWcxArg6gP5c7Fy2v9W5yEaNRDtSPNW3QHGK1O+hNDVN
 wp3k+EkNHwcDukAQsWU1bVItrI4yxFi6Qy6ILJweqF7xWOe8ykW6+S0urBW1YRkgel5c=
X-Received: by 2002:a05:6a00:1a54:b029:2d8:695e:c893 with SMTP id
 h20-20020a056a001a54b02902d8695ec893mr4281659pfv.27.1622809864696; 
 Fri, 04 Jun 2021 05:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZIn8GN9gqlbv95AAjX4rBxUXRYfzR2hTA9s+CCmo0vOS38G/DEmYbTQiLOSybFG5fV7X5Hw==
X-Received: by 2002:a05:6a00:1a54:b029:2d8:695e:c893 with SMTP id
 h20-20020a056a001a54b02902d8695ec893mr4281626pfv.27.1622809864296; 
 Fri, 04 Jun 2021 05:31:04 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g18sm1748316pfi.199.2021.06.04.05.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 05:31:03 -0700 (PDT)
Subject: Re: [PULL 0/7] Net patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210604073617.69622-1-jasowang@redhat.com>
 <CAFEAcA_GAdd6vFc9mxDuJY3WKb9L5XH9m40T4Z2anQHQqrewKA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5b5eaa20-5764-3480-256b-cd1759bf3c59@redhat.com>
Date: Fri, 4 Jun 2021 20:30:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GAdd6vFc9mxDuJY3WKb9L5XH9m40T4Z2anQHQqrewKA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/4 下午6:37, Peter Maydell 写道:
> On Fri, 4 Jun 2021 at 08:36, Jason Wang <jasowang@redhat.com> wrote:
>> The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 90322e646e87c1440661cb3ddbc0cc94309d8a4f:
>>
>>    MAINTAINERS: Added eBPF maintainers information. (2021-06-04 15:25:46 +0800)
>>
>> ----------------------------------------------------------------
>>
>> ----------------------------------------------------------------
>> Andrew Melnychenko (7):
>>        net/tap: Added TUNSETSTEERINGEBPF code.
>>        net: Added SetSteeringEBPF method for NetClientState.
>>        ebpf: Added eBPF RSS program.
>>        ebpf: Added eBPF RSS loader.
>>        virtio-net: Added eBPF RSS to virtio-net.
>>        docs: Added eBPF documentation.
>>        MAINTAINERS: Added eBPF maintainers information.
>
> Checkpatch reports a lot of hardcoded tabs -- can you fix those,
> please, or are they deliberate?


It's the automated generated bpf skeleton header. So I think we can just 
leave it as is.

Thanks


>
> thanks
> -- PMM
>


