Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD63726C9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:48:56 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpnb-0001oB-Vd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldpli-0000JD-EW
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldplf-0001Tl-GJ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620114414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGcFac8QguqItCUGMdC5MrmMvkhE29a7E1IitymemvA=;
 b=hDTEhXjbKixoDpUbOIlZY+hn4K0azUPiWRjKWWqIm6q6vACE96f3Hu7z3imIZoIv2g7zpH
 EccCzgGRmPqI6ZVFffGBgu4fo+GaxNGhyktLAfzHEAgkWEfIB1ABschBk9aeAt0bz4l1UN
 Dz3RCO5++LC/vNEHUJb9/BlplNgW3+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-L5Hq75hnN1aliqoR1doVhA-1; Tue, 04 May 2021 03:46:52 -0400
X-MC-Unique: L5Hq75hnN1aliqoR1doVhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01BA6801817;
 Tue,  4 May 2021 07:46:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-229.ams2.redhat.com
 [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B0079911;
 Tue,  4 May 2021 07:46:38 +0000 (UTC)
Subject: Re: [PATCH v2] Document qemu-img options data_file and data_file_raw
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210430133452.253102-1-ckuehl@redhat.com>
 <3f24af14-f324-1707-37b9-cbfc9bd082dd@redhat.com>
 <b12175c4-db70-dc1e-6763-3124c1ad52ae@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <85b9670c-6e1d-89ba-1b19-50aa370ee48a@redhat.com>
Date: Tue, 4 May 2021 09:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b12175c4-db70-dc1e-6763-3124c1ad52ae@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 01:15, Connor Kuehl wrote:
> On 4/30/21 9:45 AM, Max Reitz wrote:
>>> +  ``data_file_raw``
>>> +    If this option is set to ``on``, QEMU will always keep the external
>>> +    data file consistent as a standalone read-only raw image. It does
>>> +    this by forwarding updates through to the raw image in addition to
>>> +    updating the image metadata. If set to ``off``, QEMU will only
>>> +    update the image metadata without forwarding the changes through
>>> +    to the raw image. The default value is ``off``.
>>
>> Hm, what updates and what changes?  I mean, the first part makes sense (the “It does this by...”), but the second part doesn’t.  qemu will still forward most writes to the data file.  (Not all, but most.)
>>
>> (Also, nit pick: With data_file_raw=off, the data file is not a raw image.  (You still call it that in the penultimate sentence.))
>> When you write data to a qcow2 file with data_file, the data also goes to the data_file, most of the time.  The exception is when it can be handled with a metadata update, i.e. when it's a zero write or discard.
>>
>> In addition, such updates (i.e. zero writes, I presume) not happening to the data file are usually a minor problem.  The real problem is that without data_file_raw, data clusters can be allocated anywhere in the data file, whereas with data_file_raw, they are allocated at their respective guest offset (i.e. the host offset always equals the guest offset).
>>
>> I personally would have been fine with the first sentence, but if we want more of an explanation...  Perhaps:
>>
>> <<EOF
>>
>> If this option is set to ``on``, QEMU will always keep the external data file consistent as a standalone read-only raw image.
>>
>> It does this by effectively forwarding all write accesses that happen to the qcow2 file to the raw data file, including their offsets. Therefore, data that is visible on the qcow2 node (i.e., to the guest) at some offset is visible at the same offset in the raw data file.
>>
>> If this option is ``off``, QEMU will use the data file just to store data in an effectively arbitrary manner.  The file’s content will not make sense without the accompanying qcow2 metadata.  Where data is written will have no relation to its offset as seen by the guest, and some writes (specifically zero writes) may not be forwarded to the data file at all, but will only be handled by modifying qcow2 metadata.
>>
>> In short: With data_file_raw, the data file reads as a valid raw VM image file.  Without it, its content can only be interpreted by reading the accompanying qcow2 metadata.
>>
>> Note that this option only makes the data file valid as a read-only raw image.  You should not write to it, as this may effectively corrupt the qcow2 metadata (for example, dirty bitmaps may become out of sync).
>>
>> EOF
>>
>> This got longer than I wanted it to be.  Hm.  Anyway, what do you think?
> 
> I found it very helpful. I'll incorporate your explanation into the next
> revision.
> 
> I'm wondering what the most appropriate trailer would be for the next
> revision?
> 
> 	Suggested-by: Max [..]
> 	Co-developed-by: Max [..]
> 
> Let me know if you have a strong preference, otherwise I'll go with
> Suggested-by:

I’m fine without any tag (if I merge this patch, it’ll get my S-o-b 
anyway :)), but if any, I’d probably go with a Suggested-by, yes.

Max


