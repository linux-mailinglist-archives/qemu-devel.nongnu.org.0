Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984734E73B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:47:32 +0100 (CET)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjLn-00058i-7f
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:47:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjHf-0003wM-84
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nXjHZ-00032e-PZ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648212189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NV4FtAO8EJZu+BZTQ10GLPFRVBHDrA7UukpfYrdXVs8=;
 b=Gy29+ONBLuRvU8ytjJCDWdgHH/EUmfdAPfE6gHmtXlKh6bgseVMsRaxRpKtBs3z2RdRvhv
 EoLpCt9V06I7+NSu74nVUd6JuQju9/ZD9k2WVzt3VR7Qg/S8pD0oYofDFrYdoehlOBruuI
 OQe0AF6gGo+ZchjH8APeSsSbragN4nw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-P5BsGM0kPIW_2D46IOhASA-1; Fri, 25 Mar 2022 08:43:07 -0400
X-MC-Unique: P5BsGM0kPIW_2D46IOhASA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4BF801585
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:43:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 686D7C15D78;
 Fri, 25 Mar 2022 12:43:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51EF621E6821; Fri, 25 Mar 2022 13:43:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-3-victortoso@redhat.com>
 <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
 <CAFn=p-bMTFpikwR5JMQWCP1rPSnn55JPpfy-QuREO91MD6jKmg@mail.gmail.com>
Date: Fri, 25 Mar 2022 13:43:06 +0100
In-Reply-To: <CAFn=p-bMTFpikwR5JMQWCP1rPSnn55JPpfy-QuREO91MD6jKmg@mail.gmail.com>
 (John Snow's message of "Thu, 24 Mar 2022 16:40:06 -0400")
Message-ID: <87o81unqxx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Thu, Mar 24, 2022 at 3:15 PM John Snow <jsnow@redhat.com> wrote:
>>
>>
>>
>> On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>>>
>>> Fatal is not optional.
>>>
>>> Signed-off-by: Victor Toso <victortoso@redhat.com>
>>> ---
>>>  qapi/block-core.json | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index e89f2dfb5b..585a9e020e 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -5008,7 +5008,7 @@
>>>  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
>>>  #      "data": { "device": "ide0-hd0", "node-name": "node0",
>>>  #                "msg": "Prevented active L1 table overwrite", "offset": 196608,
>>> -#                "size": 65536 },
>>> +#                "size": 65536, "fatal": false },
>>>  #      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
>>>  #
>>>  # Since: 1.7
>>> --
>>> 2.35.1
>>
>>
>> Is this the correct fatality setting for this particular case? Default is implied to be true.
>
> (1) We don't seem to actually emit this particular message anymore. I
> don't think it exists in the tree.

I doubt we ever emitted it.

> (2) The only fatal=False messages I can see is
> "Cannot free unaligned cluster %#llx"
>
> (Try grepping for qcow2_signal_corruption)
>
> so maybe we should pick a new example that might really exist. iotest
> 060 seems to test this, so that can be used as a guide.

Yes, please.


