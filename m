Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022A4A4829
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 14:32:12 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWmu-0005qV-Di
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 08:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEV6a-0003wg-QH
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEV6X-0001pg-Py
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643629456;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EQdACnVG4eNJfDJQDLugXnOGZtsrsV/F0ppysQ65iFw=;
 b=AnwRrDMKZFWO/ZIQ/JZkbO6jcR+9l4WodYzcTtBhLEiIb8yABmJfGw4luG26Oi8J5w72OD
 iM6KKMWxfdKhiiJaNFnpxaWFl4oIQcRB0fJ3HJutUSPe3E9HLEL5reSmXvYOlPlfWKwOlJ
 nsSsNjUFDWjLkqi+Lkpl55aZjv2uNOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-l2CApO_MOdmSpuM8RvHnoQ-1; Mon, 31 Jan 2022 06:44:10 -0500
X-MC-Unique: l2CApO_MOdmSpuM8RvHnoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73DDD84B9A4;
 Mon, 31 Jan 2022 11:44:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A145D7D723;
 Mon, 31 Jan 2022 11:44:06 +0000 (UTC)
Date: Mon, 31 Jan 2022 11:44:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to
 launch-measure response
Message-ID: <YffLgx48+mM2SiIX@redhat.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 11:15:39AM +0000, Dov Murik wrote:
> Currently the responses of QMP commands query-sev-launch-measure and
> query-sev-attestation-report return just the signed measurement. In
> order to validate it, the Guest Owner must know the exact guest launch
> digest, besides other host and guest properties which are included in
> the measurement.
> 
> The other host and guest details (SEV API major, SEV API minor, SEV
> build, and guest policy) are all available via query-sev QMP command.
> However, the launch digest is not available.  This makes checking the
> measurement harder for the Guest Owner, as it has to iterate through all
> allowed launch digests and compute the expected measurement.

So more specifically to validate the measurement, the guest owner is
currently calculating:

   expected_measurement = HMAC(0x04 || API_MAJOR || API_MINOR || BUILD ||
                               GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)

where GCTX.LD is

    SHA256(FIRMWARE-CODE || KERNEL-HASHES-TABLE || VMSA-FOREACH-VCPU)

and comparing expected_measurement to the actual measurement from
query-sev-launch-measure.

> Add a new field debug-launch-digest to the response of
> query-sev-launch-measure and query-sev-attestation-report which includes
> the guest launch digest, which is the SHA256 of all initial memory added
> to the guest via sev_launch_update_data().

So this new 'debug-launch-digest' field is returning GCTX.LD value
above.

> Note that the value of debug-launch-digest should not be used for
> verifying the measurement, because it is not signed.  Hence the choice
> of the 'debug-' prefix for the field's name.

The earlier paragraph talks about making it easier for the guest
owner to verify the measurement, but here is saying this new field
should not be used to verify the measurement.

So I'm confused as to what is the benefit of returning this info ?

Due to the lack of guarantees about this data, it can't be used
for a real production use case. AFAIK it can only be useful if
debugging your code logic used for validating measurwements.
Am I missing something about the motivation here ?


If the guest owner is comparing expected and actual measurements
and they get a mis-match, all they'll see is two big hex strings
representing the HMAC value, and they'll have to work backwards
to figure out whether one of their expected inputs had a mistake,
or their algorithm was buggy.

If the guest owner is comparing the expectd and actual launch
digest and they get a mis-match, again they'll just huave two
big hex strings representing the SHA256 value, and they'll have
to work backwards to figure out whether one of their expected
inputs had a mistake, or their algorithm was buggy.

By having this 'debug-launch-digest' field, you can slightly
more quickly determine whether your mistake lies in your impl
of the HMAC alg, or API_MAJOR || API_MINOR || BUILD || GCTX.POLICY
values, vs a mistake in your calc of the debug-launch-digest
field. Basically it gives you one step in bisecting the mistake
location.

Is that really compelling enough to justify adding this extra
info to the QAPI commands ? IME of writing code to verify the SEV
measurement, there were many little ways I screwed up at first
and having this field would not have made a significant difference
to my debugging efforts.

What was/would have been useful was having a known good reference
implementation of the algorithm which dumped out all the key
values for the different steps of process. I used James Bottomley's
python script as my reference and hacked it to dump out key values
so I could see what step I went wrong in. I was still working blind
for doing the SEV-ES VMSA and kernel hashes table work.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


