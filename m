Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEB4D2053
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:37:48 +0100 (CET)
Received: from localhost ([::1]:39012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReiQ-0002ow-3K
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRehR-00025j-JC; Tue, 08 Mar 2022 13:36:45 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46063
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRehQ-0006T2-0i; Tue, 08 Mar 2022 13:36:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so115912pjl.4; 
 Tue, 08 Mar 2022 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XyfIRO0wUw0eSCEAIaFOAn6z7bfgZQ7zQtbc5EUO4Mg=;
 b=SBKngIsPbQs0hGqAFD1KhW073y8mPsuSPy9K5L+zSQv3R6IrP7kDOSGMGEiz40i6o1
 YH8STvZ/ejn0TNS631r5PtHBTTDD/DYpGj12hpBMNRyt59Onw7BSiFqLrS07ywjD93Cr
 4NfgGVnI6g2dgZER38wvGFyvvWQ8zeyPloy9X1CiT1Ftl9s1QPD835BhKX42x7lm/LgQ
 Nuh53mV9loWUpl4Ti5B8ep3BEhxgdu/fRGUFU84m2l3VLWnr6Ro3YvM44SVa+NhpJV04
 akQvcC6+6GdvmJYytdhDMUu516kWOnRO+Rwcco7XH77JbLqnGWHBE4b8R8gzVYY/rove
 1+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XyfIRO0wUw0eSCEAIaFOAn6z7bfgZQ7zQtbc5EUO4Mg=;
 b=rVeyfDsj1+gsrxHV1HwvaoZeGDNoW1xUqnfWZFVMyqRp4CO1VL1el04WT3URstf1kw
 gbliqxZ7ILldct8s1O7krqRWyxnSmMO/bLITvh1eZaUc3p+4lr/sy9qoD+hVfRHlqMqH
 t8xeTudsATGio4UdX/d07EuEZBBi8L9H+yDINN4CYBsNWNgR0skw20Q5zrrRhrO8iiQF
 gv+pP8WEDxoeeGmcGqYvzX3BXBUuVHaoxNZ+maoBb2ztSFaL4bqqO9X+rB7p4T0Q+p4C
 yYGuU+PDnxtHk9AHlN0F3ni+ITlwa/Oc/yxbOBCUa3suQ95GGmTt3f7GKjEG27+1IYDo
 xdkA==
X-Gm-Message-State: AOAM533YHo3xOnn8cqkvodCh4GSm+lkuraJxLiMhOYxr1SkjrqpoPjqT
 MOVvI2ozVbEdV5vEGjViqZU=
X-Google-Smtp-Source: ABdhPJwGS0sIOHJxhQtOYPGxPJEP10OQZ+iRUGBw0C+Osiwx/Z32eJ74FSmghvkFhQz3JLYKZeWwMA==
X-Received: by 2002:a17:90b:1b12:b0:1bf:1e5d:55e0 with SMTP id
 nu18-20020a17090b1b1200b001bf1e5d55e0mr6145576pjb.213.1646764602469; 
 Tue, 08 Mar 2022 10:36:42 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 s30-20020a056a001c5e00b004f73f27aa40sm1437280pfw.161.2022.03.08.10.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:36:41 -0800 (PST)
Message-ID: <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
Date: Tue, 8 Mar 2022 19:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 00/18] migration queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, s.reiter@proxmox.com, hreitz@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, f.ebner@proxmox.com,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 15:46, Peter Maydell wrote:
> On Wed, 2 Mar 2022 at 18:32, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
>>
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>>
>>    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220302b
>>
>> for you to fetch changes up to 18621987027b1800f315fb9e29967e7b5398ef6f:
>>
>>    migration: Remove load_state_old and minimum_version_id_old (2022-03-02 18:20:45 +0000)
>>
>> ----------------------------------------------------------------
>> Migration/HMP/Virtio pull 2022-03-02
>>
>> A bit of a mix this time:
>>    * Minor fixes from myself, Hanna, and Jack
>>    * VNC password rework by Stefan and Fabian
>>    * Postcopy changes from Peter X that are
>>      the start of a larger series to come
>>    * Removing the prehistoic load_state_old
>>      code from Peter M

I'm seeing an error on the s390x runner:

▶  26/547 ERROR:../tests/qtest/migration-test.c:276:check_guests_ram: 
assertion failed: (bad == 0) ERROR

  26/547 qemu:qtest+qtest-i386 / qtest-i386/migration-test 
            ERROR          78.87s   killed by signal 6 SIGABRT

https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/562515884#L7848

