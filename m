Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFC561AE2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:03:15 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tpC-0005RR-2Y
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o6tiG-0000lP-6Z
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:56:04 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1o6tiD-0004wg-En
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:56:03 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDC701FD0D;
 Thu, 30 Jun 2022 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656593759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IORZLbzdqKGVG46uvR4pUlstQ4Sbl4NKq6nY/wm+5Eo=;
 b=mmoCQVOzL7AKHFoxY/oCl2h4gBhIQGY5LXYqOM+UjspTgsNKx0XyYbyVTogJyusmfoSswV
 SxlpCrGR/8wiI0w4BN1178Afsqguem/sfYYWdk4cwYHhp8iW+cN+ZNltC5mYwFtEZTheWM
 f3LXSYT+8Ax3LfIvJvUZZahTOXf0Eu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656593759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IORZLbzdqKGVG46uvR4pUlstQ4Sbl4NKq6nY/wm+5Eo=;
 b=c4ubMzI+JwMJGirgd+CXWPLz+m2twJfX2KLuifD9yw0Ydwii40bxKe9kqrINAAcmXXhfau
 n7u/zx4MMsIsgSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02BAB139E9;
 Thu, 30 Jun 2022 12:55:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JkiQOV6dvWKwQAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 30 Jun 2022 12:55:58 +0000
Message-ID: <d5166344-54d5-4f51-6334-5e632195e53e@suse.de>
Date: Thu, 30 Jun 2022 14:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
 <073c1687-d30f-8f41-b87e-83372137708a@suse.de> <YqHJKgA5OG80dljx@redhat.com>
 <YqHtDN/+DNUpB/ve@work-vm> <2341fe7b-9831-24eb-c78c-39497901eea9@suse.de>
 <Yr1415pu4s9moMoB@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yr1415pu4s9moMoB@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/30/22 12:20, Daniel P. Berrangé wrote:
> On Thu, Jun 30, 2022 at 12:14:36PM +0200, Claudio Fontana wrote:
>> On 6/9/22 14:52, Dr. David Alan Gilbert wrote:
>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>> On Thu, Jun 09, 2022 at 12:07:31PM +0200, Claudio Fontana wrote:
>>>>> Hello all,
>>>>>
>>>>> it would be really good to be able to rely on this command or something similar,
>>>>> to be able to know the approximate size of a migration before starting it.
>>>>>
>>>>> in QEMU ram_bytes_total() returns what I would like to have,
>>>>> but there is currently no QMP way to get it without starting a migration,
>>>>> which when trying to optimize it/size it is just about too late.
>>>>
>>>> Aside from the main VM RAM, what other RAM blocks are likely to have
>>>> a size large enough to be of consequence to the live migration
>>>> data copy, and whose size is not already known to the mgmt app from
>>>> the guest config choices it made ? VGA RAM could be a few 100MB I
>>>> guess, but the mgmt app knows about that. I've always assumed everything
>>>> else is just noise in comparison to the main RAM region.
>>>>
>>>> Still I wonder how useful this is as its just a static figure, and the
>>>> problems with migration transfer are the bulking up of data when the
>>>> VM is repeatedly dirtying stuff at a high rate.
>>>>
>>>>> Do you think x-query-ramblock could be promoted to non-experimental?
>>>>
>>>> It would have to be re-written, as this current impl is just emitting
>>>> a huge printf formatted string. To be considered supportable, the data
>>>> would have to be formally modelled in QAPI instead.
>>>>
>>>> IOW, it would be a case of introducing a new command that emits formal
>>>> data, convertintg 'info ramblock' to use that, and then deprecating this 
>>>> x-query-ramblock.
>>>>
>>>>> Should another one be made available instead, like :
>>>>> query-ram-bytes-total ?
>>>>
>>>> That would be simpler if you're just wanting it to give a single
>>>> figure.
>>>
>>> Is this what qmp_query_memory_size_summary does?
>>
>> No, I am not looking at something returning the machine->ram_size,
>> but rather how many bytes are actually used in each RAMBlock, in order to estimate the transfer size of a guest to disk.
>>
>> This would be the return value of something like migration/ram.c::ram_bytes_total().
>>
>> The main guest RAM total size is in most cases an overestimation of the actual bytes required to be transferred.
>>
>> If there was such a feature that just returns ram_bytes_total via QMP,
>> by knowing the size in bytes before the transfer, we can prealloc the space on disk, which would improve the performance of this series:
>>
>> https://patchew.org/Libvirt/20220607091936.7948-1-cfontana@suse.de/
>>
>> The interleaved format I posted there works just fine to migrate a suspended VM to disk (virsh save) from multifd channels to a single file,
>> but still incurs in a 4-5% performance penalty compared with the multiple files approach,
>> that is apparently due to multiple threads competing on acquiring locks to adjust the file size (on XFS).
>>
>> Doing a fallocate() would likely remove this performance decrease compared with multifd to multiple files,
>> but requires knowing beforehand the approximate size of the transfer, and as mentioned mnachine->ram_size is just overkill in practice and risks erroring out if not enough space is available.
>>
>> Feedback on the interleaved format I posted there is welcome as well,
> 
> I still believe that libvirt is the wrong place to be implementing any
> of this logic. It all belongs in QEMU, because QEMU is the place which
> holds all the information needed to do an optimal job, and libvirt does
> not, as this request for extra QMP features shows.
> 
> With regards,
> Daniel

Hi Daniel,

I know your position about the implementation in libvirt vs a potential (non-existing for now) QEMU implementation.

The implementation in QEMU seems to me to require more investment due to the need of a new migration target protocol to be defined carefully (possibly "disk://")
and the need to alter and test all migrated devices participating in the creating the migration stream.

I don't think this request for an QMP feature shows anything really.

Knowing the _actual_ size of a migration stream before deciding to migrate is I think a pretty useful feature in itself I would think,
including for libvirt and higher level components in the stack. The lack of the feature just shows, well, the lack of this feature.

Regarding my prototype I pointed at that happens to use libvirt, I wonder if you or anyone have any feedback on the actual format of the VM saved in parallel to disk,
regardless of which component writes it, libvirt or QEMU, and I wonder also if there is any feedback on the O_DIRECT -friendly I/O API, which are both things we can make progress on also regardless of the libvirt vs QEMU implementation of the parallel migration to disk.

Thanks,

Claudio

