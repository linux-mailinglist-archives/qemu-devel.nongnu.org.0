Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F118023AC3F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 20:21:00 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2f52-000327-2i
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 14:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1k2f3s-0002PX-LK
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 14:19:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31498
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1k2f3q-0002gC-Qh
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 14:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596478785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LF45nFMM8mwO6cXTItc3rG6vPFXyx7GbP9SN+qDZXk=;
 b=h7gESGSLuciU/2Mhu7lob1mLjAN6q+j5sIra0tN188c004jPMz4HAKoYt9XXYi5YuSxrGk
 i96ZCuqsZQJEdMpBITqt8qOpB+ytyodwV3y79h6Q0LLp+MdJf2PLg5llJa6hL5/iy7WajZ
 PAwNc68vTH5u0dr2h5dws0QDpp4kxrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-X2GLuTMHOky5Yb8q7IV1Yw-1; Mon, 03 Aug 2020 14:19:44 -0400
X-MC-Unique: X2GLuTMHOky5Yb8q7IV1Yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A0F8005B0;
 Mon,  3 Aug 2020 18:19:43 +0000 (UTC)
Received: from ibm-p8-OVS-01-fsp.mgmt.pnr.lab.eng.rdu2.redhat.com (unknown
 [10.10.115.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55BE75C6D9;
 Mon,  3 Aug 2020 18:19:31 +0000 (UTC)
Subject: Re: cleanups with long-term benefits (was Re: [PATCH] schemas: Add
 vim modeline)
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20200729185024.121766-1-abologna@redhat.com>
 <87ime52wxd.fsf@dusky.pond.sub.org> <20200730093732.GB3477223@redhat.com>
 <87k0ylz0ep.fsf@dusky.pond.sub.org> <20200730132446.GL3477223@redhat.com>
 <875za33ku1.fsf@dusky.pond.sub.org> <20200731150738.GB3660103@redhat.com>
 <2cf1a431-9d2c-8ad6-446e-f10b36219764@redhat.com>
 <87d048i1m2.fsf@dusky.pond.sub.org>
 <83bbe0b0-c5e0-e3b7-5ba1-5946098370d5@redhat.com>
 <87ft94klyl.fsf@dusky.pond.sub.org>
 <490a0786-73f3-411e-4dfe-8c2ae90de251@redhat.com>
 <17a92222-2627-4961-b57e-1f1f5c86e14a@redhat.com>
 <e186e3b5-4aef-42c0-6957-2e5ae430686c@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6514f2e2-4694-6790-7663-f8a8f6a91e5a@redhat.com>
Date: Mon, 3 Aug 2020 14:19:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e186e3b5-4aef-42c0-6957-2e5ae430686c@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 13:51:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/20 2:16 PM, Paolo Bonzini wrote:
> On 03/08/20 20:10, John Snow wrote:
>> Heresy:
>>
>> Docstrings could become part of the data format so they can be parsed,
>> analyzed and validated. Parsers largely treat comments like non-semantic
>> information and discard it. Round-trip parsers that preserve comments in
>> any language are extremely rare.
>>
>> If the docstrings are relevant to the generator and aren't discardable,
>> they should be fully-fledged data members.
>>
>> In a prototype I had for a YAML format, I just promoted docstrings
>> directly to fields, so I could allow clients to query help text for
>> individual commands.
> 
> This would be actually a good idea, but somebody has to write the code.
>   Each field's docstring should be attached to the field, however---no
> parsing needed only looking at the tree.  Take a look at what Nir posted:
> 
>> Here is the patch adding schema convertor from qemu "json" format to
>> standard yaml:
>> https://github.com/oVirt/vdsm/commit/e57b69e72987c0929b20306c454835b52b5eb7ee
>>
>> The current version of the new yaml based schema:
>> https://github.com/oVirt/vdsm/blob/master/lib/vdsm/api/vdsm-api.yml
> 
> 
>      VmDiskDevice: &VmDiskDevice
>          added: '3.1'
>          description: Properties of a VM disk device.
>          name: VmDiskDevice
>          properties:
>          -   description: Indicates if writes are prohibited for the
>                  device
>              name: readonly
>              type: boolean
> 
>          -   description: The size of the disk (in bytes)
>              name: apparentsize
>              type: uint
> 
> etc.
> 
> Paolo
> 

I was working on a small prototype that used something that looked like 
this; the "*opt" format was traded for "?opt", but otherwise:


struct:
   name: AudiodevPerDirectionOptions
   doc: >
     General audio backend options that are used for both
     playback and recording.
   since: '4.0'
   members:

     ?mixing-engine:
       type: bool
       default: 'true'
       since: '4.2'
       doc: |
         Use QEMU's mixing engine to mix all streams inside QEMU and
         convert audio formats when not supported by the backend.

         When set to off, fixed-settings must be also off.

     ?fixed-settings:
       type: bool
       default: 'true'
       doc: >-
         Use fixed settings for host input/output.
         When off, frequency, channels and format must not be specified.

     ?frequency:
       type: bool
       default: '44100'
       doc: >-
         frequency to use when using fixed settings.

     ?channels:
       type: 'uint32'
       default: 2
       doc: >-
         Number of channels when using fixed settings.

     ?voices:
       type: 'uint32'
       default: 1
       doc: "Number of voices to use."

     ?format:
       type: 'AudioFormat'
       default: 's16'
       doc: "Sample format to use when using fixed settings."

     ?buffer-length:
       type: 'uint32'
       doc: 'The buffer length, in microseconds.'

   features:
     my-cool-feature:
       since: '6.0'
       doc: 'This is, no doubt, an extremely cool feature.'

     my-bad-feature:
       doc: 'This is a very bad feature. I am sorry for making it.'
       since: '1.0'
       deprecated: '5.9'


