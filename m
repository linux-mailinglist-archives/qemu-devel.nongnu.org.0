Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE763AFDEB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:31:06 +0200 (CEST)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvasD-0001OO-2d
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvaqr-0000M8-Q3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvaqp-0003ug-1N
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624346978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wL+rmDutY7pBDkFjWj8nDqxzpyJSm3a7+cgOKHWK+IY=;
 b=EQ42ux4JP9yIj/OQujv3bnFLtaAWJA4M9/TAFL65GzTAmlUiaeU7S4iaug/FgW7L3Oi0PD
 LuSkWhoiWw2C6GB2Hjphalw0NdUnG5wUKA8vXUlJ8rsKnr9rFXM3XG9Zqmeack6n39HB/b
 cN7Wgp0B0UDJyhY/22vjrI9HAOYuYvo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ykM_NzazN9ahck13lwRhjQ-1; Tue, 22 Jun 2021 03:29:37 -0400
X-MC-Unique: ykM_NzazN9ahck13lwRhjQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u16-20020a5d51500000b029011a6a17cf62so8999728wrt.13
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wL+rmDutY7pBDkFjWj8nDqxzpyJSm3a7+cgOKHWK+IY=;
 b=MN2naFEcBhWgqR2gGjoHjfX+atGd0rA42Vle7Nk8Y58Tt970zEAHzoL8X4G0xF0zlP
 BOzhvsku0NVarg+gZQT1RDDKOh//JIj+PfXMFqALeDofrPPFe/8cd5SaV3ITzoa2/e3N
 1iHHLZiy/9mC+2J+/th/49qPdUk4aun5Kt4bTymPIwn+QLhux3UC8LPMS0v2pysnCcVA
 QSQ2S57Gpx1bv6CNxNEWxyt0iebO49HaQFOMJie4y2iZaGPnNxjVGxdKMYE1XpTiTJgJ
 C/7y1Ku0CIVUurb5Ouy0BLKC3T3NLWSLXJfGWQO1p6p3k/9BZm8Lf42JOft2jAoURI1W
 O/+Q==
X-Gm-Message-State: AOAM531BWmJ0UnumyeFIJtH7aYdYrQaHv5D/O25A/7JY+wGep3aFsQkV
 FseiOyiZI3I8IsEIXYOBnsRvRJMHgXpvgyejwML981YhUmlLxWMHCAqebLxoG8aUBxYfd4TUDaT
 Fg+O0HwDWEPW6kTI=
X-Received: by 2002:adf:9062:: with SMTP id h89mr1398120wrh.130.1624346976343; 
 Tue, 22 Jun 2021 00:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysi+C6Og9wynE5IEF0Ie0fvGiTWUSEsnYsTsH9Go0SOG+/C3DMQmmaGLpWfok7HEcTUtwdpg==
X-Received: by 2002:adf:9062:: with SMTP id h89mr1398088wrh.130.1624346976010; 
 Tue, 22 Jun 2021 00:29:36 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n8sm1603258wmc.45.2021.06.22.00.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:29:35 -0700 (PDT)
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: Fam Zheng <fam@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
 <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
 <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
 <0EF3A65E-39CB-4114-8572-001C2DF05863@euphon.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7cd0827-5ce3-0aaf-c222-f13f84cd4f2c@redhat.com>
Date: Tue, 22 Jun 2021 09:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0EF3A65E-39CB-4114-8572-001C2DF05863@euphon.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 5:36 PM, Fam Zheng wrote:
>> On 21 Jun 2021, at 16:13, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 6/21/21 3:18 PM, Fam Zheng wrote:
>>>> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>>>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>>>> -ENOMEM in case of error. The driver was correctly handling the
>>>> error path to recycle its volatile IOVA mappings.
>>>>
>>>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>>>> DMA mappings per container", April 2019) added the -ENOSPC error to
>>>> signal the user exhausted the DMA mappings available for a container.
>>>>
>>>> The block driver started to mis-behave:
>>>>
>>>> qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>>>> (qemu)
>>>> (qemu) info status
>>>> VM status: paused (io-error)
>>>> (qemu) c
>>>> VFIO_MAP_DMA failed: No space left on device
>>>> qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
>>>
>>> Hi Phil,
>>>
>>>
>>> The diff looks good to me, but I’m not sure what exactly caused the assertion failure. There is `if (r) { goto fail; }` that handles -ENOSPC before, so it should be treated as a general case. What am I missing?
>>
>> Good catch, ENOSPC ends setting BLOCK_DEVICE_IO_STATUS_NOSPACE
>> -> BLOCK_ERROR_ACTION_STOP, so the VM is paused with DMA mapping
>> exhausted. I don't understand the full "VM resume" path, but this
>> is not what we want (IO_NOSPACE is to warn the operator to add
>> more storage and resume, which is pointless in our case, resuming
>> won't help until we flush the mappings).
>>
>> IIUC what we want is return ENOMEM to set BLOCK_DEVICE_IO_STATUS_FAILED.
> 
> I agree with that. It just makes me feel there’s another bug in the resuming code path. Can you get a backtrace?

It seems the resuming code path bug has been fixed elsewhere:

(qemu) info status
info status
VM status: paused (io-error)
(qemu) c
c
2021-06-22T07:27:00.745466Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
space left on device
(qemu) info status
info status
VM status: paused (io-error)
(qemu) c
c
2021-06-22T07:27:12.458137Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
space left on device
(qemu) c
c
2021-06-22T07:27:13.439167Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
space left on device
(qemu) c
c
2021-06-22T07:27:14.272071Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
space left on device
(qemu)


