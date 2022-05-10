Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345552121B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:23:35 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noN1i-0003ec-8Q
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMpU-0000nO-7O
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMpR-00082P-Rs
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652177452;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5407T1nhVDz0ycKzR+0Tfj2tnb/MkAKBxK1Z1597Bi4=;
 b=ZglmfXyHVTaPARJ2GPPwlb1T5JqC6miYGfmQQnoM6airm0J6bJZmQ1kFJ5nx6wvRHqNvaG
 tvq6adpZCv51KdHTn88Y4elRPNfDd2C+XdGD02RvfVL45uuu1Jyd8dswGeh+GcndIP9rWe
 E6IZILyqSOu2nSWHV5ygaO+TjOchkUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-HkLKLSwdO66krURd1dBdrw-1; Tue, 10 May 2022 06:10:51 -0400
X-MC-Unique: HkLKLSwdO66krURd1dBdrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96D63811E75
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 10:10:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF42A111E411;
 Tue, 10 May 2022 10:10:47 +0000 (UTC)
Date: Tue, 10 May 2022 11:10:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 2/8] qapi: golang: Generate qapi's alternate types
 in Go
Message-ID: <Yno6Jb1Y9GmgD5wr@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <20220401224104.145961-3-victortoso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401224104.145961-3-victortoso@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 02, 2022 at 12:40:58AM +0200, Victor Toso wrote:
> This patch handles QAPI alternate types and generates data structures
> in Go that handles it.
> 
> At this moment, there are 5 alternates in qemu/qapi, they are:
>  * BlockDirtyBitmapMergeSource
>  * Qcow2OverlapChecks
>  * BlockdevRef
>  * BlockdevRefOrNull
>  * StrOrNull
> 
> Alternate types are similar to Union but without a discriminator that
> can be used to identify the underlying value on the wire. It is needed
> to infer it. That can't be easily mapped in Go.

I don't buy that. Given this example:

  type BlockdevRef struct {
        // Options are:
        // * definition (BlockdevOptions): defines a new block device inline
        // * reference (string): references the ID of an existing block device
        Value Any
  }

What is the problem with having this Go struct:

  type BlockdevRef struct {
        Definition *BlockdevOptions
	Reference *string
  }

when deserializing from JSON, we know exactly which one of these two
fields to populate. The programmer consuming this can look at which
field is non-nil.

When serializing to JSON, we serialize which ever field is non-nil.

If both fields are non-nil that's a programmer bug. Either ignore it
and only serialize the first non-nil field, or raise an error.

> 
> For each Alternate type, we will be using a Any type to hold the
> value. 'Any' is an alias type for interface{} (similar to void* in C).
> 
> Similarly to the Enum types (see previous commit), we will implement
> Marshaler and Unmarshaler interfaces for the Alternate types and in
> those MarshalJSON() and UnmarshalJSON() methods is where we are going
> to put the logic to read/set alternate's value.
> 
> Note that on UnmarshalJSON(), a helper function called StrictDecode()
> will be used. This function is the main logic to infer if a given JSON
> object fits in a given Go struct. Because we only have 5 alternate
> types, it is not hard to validate the unmarshaling logic but we might
> need to improve it in the future if Alternate with branches that have
> similar fields appear.
> 
> Examples:
>  * BlockdevRef
> ```go
>     // Data to set in BlockdevOptions
>     qcow2 := BlockdevOptionsQcow2{}
>     // BlockdevRef using a string
>     qcow2.File = BlockdevRef{Value: "/some/place/my-image"}
>     opt := BlockdevOptions{}
>     opt.Driver = BlockdevDriverQcow2
>     opt.Value = qcow2
> 
>     b, _ := json.Marshal(data.s)
>     // string(b) == `{"driver":"qcow2","file":"/some/place/my-image"}`
> ```
> 
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  scripts/qapi/golang.py | 157 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 155 insertions(+), 2 deletions(-)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


