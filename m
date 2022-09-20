Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8565BEF3E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:38:05 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakwN-0008ED-Uc
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagHj-0003km-Sl
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagHf-00031N-9N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663691981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xc+keV+ciB+yhOVwVbTegfAOhVUVEdl1wSg0ek/CJ8s=;
 b=ICIGvMeJIGiCdzP4NHRInLvdx93QvaVFwwXghPB/SLGTP5OTEM/8sW3PQFuUaThn/Aw7qE
 F5orL7RluenMOqNJRGUC7N2W4J1am08RcS8ONBoxZYXjO17g54hcZc3dEDhiuQ5iIZ5v7z
 dRw/FfUgn/L/pVMZtlSpGxocNhzq8VM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-Ym0c0A30MM6R_W_kV4NHZw-1; Tue, 20 Sep 2022 12:39:40 -0400
X-MC-Unique: Ym0c0A30MM6R_W_kV4NHZw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a13-20020adfbc4d000000b00228631ddfafso1375505wrh.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Xc+keV+ciB+yhOVwVbTegfAOhVUVEdl1wSg0ek/CJ8s=;
 b=ZXjuHUT+oSxzyzpn4lRl484FJISv2Ss8DXl6F1C4zZOtJdwkgPqq3aIviGyuxyg9fU
 fRoPkULD3704iq66CH02JFQtNvjiK71bJiFnrq3nfI3k5TPQqeudJjLb6YNXf3Nw8y3T
 ucvL4YWa0PNEqqYTHu7gITUQyll3Ksw66obiAw5XFWWKZ246pf/x1jJpvGpNGjZt7L3i
 hZbV/+EKXPLR7zsn3uAwcPYI8Q8SgnxyDA/k31c0RHkRnSviLmXZgIhE7LhSDCaAXc6A
 dHjSF1yQXVyfzWT+bDKuxCnP6fVtHubInHHMpDtmThTMOcli9R4MR703ZPpjBHW9frbi
 WVkg==
X-Gm-Message-State: ACrzQf0oG18KKLEb5xpeVNAJjshlpQgNWLFBDtYwdOxTM17TWGvy27hg
 0fLPPq9ydboWbt2vs3k3GGph48BWNtBMgyH8MXQc5GSmsFiGIXtYfn84Y1edphoS2YiPz91u16Q
 WIr1oq3HqlJYXl9s=
X-Received: by 2002:a05:600c:1688:b0:3b4:8726:f304 with SMTP id
 k8-20020a05600c168800b003b48726f304mr3181787wmn.46.1663691979607; 
 Tue, 20 Sep 2022 09:39:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6B2Y5ThxxJ/qN6FRaEIzuK2E/f9luCBz7A+j8u3/b1MZi6YX4GmSi0FtyttK0qZYP53Gn3cA==
X-Received: by 2002:a05:600c:1688:b0:3b4:8726:f304 with SMTP id
 k8-20020a05600c168800b003b48726f304mr3181770wmn.46.1663691979333; 
 Tue, 20 Sep 2022 09:39:39 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 q5-20020a5d6585000000b0022add5a6fb1sm259727wru.30.2022.09.20.09.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 09:39:38 -0700 (PDT)
Message-ID: <6f29b7f8-495a-3f2c-8897-25df60c3000d@redhat.com>
Date: Tue, 20 Sep 2022 18:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 0/3] hmp queue
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com, dongli.zhang@oracle.com
Cc: armbru@redhat.com
References: <20220915154606.124713-1-dgilbert@redhat.com>
 <18a9636d-c6cf-b20b-8679-be62945dc227@redhat.com>
In-Reply-To: <18a9636d-c6cf-b20b-8679-be62945dc227@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 17.30, Thomas Huth wrote:
> On 15/09/2022 17.46, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:
>>
>>    Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into 
>> staging (2022-09-07 13:13:30 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/dagrh/qemu.git tags/pull-hmp-20220915a
>>
>> for you to fetch changes up to 22269b0436cc8e4aaac975b4c8cb01b343d09661:
>>
>>    hmp: Fix ordering of text (2022-09-15 14:13:30 +0100)
> 
> Not sure whether it's caused by this merge, but a lot of the avocado jobs 
> are failing now in the CI:
> 
>   https://gitlab.com/qemu-project/qemu/-/pipelines/643064395
> 
> I've seen some few Avocado failures (e.g. with the Debian job) in the past 
> already, but the amount of simultaneous failures seem to have increased now. 
> Does anybody have a clue what have caused this?

I was able to reproduce the issue locally on my laptop, so I bisected it ... 
it's not related to the HMP pull request, but to Peter's ARM pull request a 
little bit earlier. I'll follow up there.

  Thomas



