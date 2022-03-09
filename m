Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C74D2E7F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:57:04 +0100 (CET)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuwB-0002SB-AR
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRurN-0006Cp-3r
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRurK-0004nA-8k
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646826721;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Te4ZzHokZhIi8QDoY6k2VmlK0xq5TtH5+juPKl3dmc=;
 b=H4eWblJpGfdNi94yNTJSPgyhL91hzzAVh9HZWcnpcevUlyfYy47ggLMo5jTiiXqwPqSBp5
 ARa6mgpuozjDTA6YqylLQD5EzEAnHHkAds1VVvRN3TzhMInguSHXEkD8Xh507POfYB2AYL
 tIF1hz88b72n6aW6o+hcFF1WfQIdSyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-wrCGg-CdPlKt6u3M6Ju4KQ-1; Wed, 09 Mar 2022 06:52:00 -0500
X-MC-Unique: wrCGg-CdPlKt6u3M6Ju4KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4821091DA2;
 Wed,  9 Mar 2022 11:51:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBFC6827A9;
 Wed,  9 Mar 2022 11:51:57 +0000 (UTC)
Date: Wed, 9 Mar 2022 11:51:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: bad qemu savevm to /dev/null performance (600 MiB/s max) (Was:
 Re: starting to look at qemu savevm performance, a first regression
 detected)
Message-ID: <YiiU2gCbnJOgpZxp@redhat.com>
References: <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com>
 <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com>
 <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
 <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm>
 <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm>
MIME-Version: 1.0
In-Reply-To: <YiiS9HnS0LsiY2Hb@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 11:43:48AM +0000, Dr. David Alan Gilbert wrote:
> * Claudio Fontana (cfontana@suse.de) wrote:
> > On 3/7/22 1:28 PM, Dr. David Alan Gilbert wrote:
> > > * Claudio Fontana (cfontana@suse.de) wrote:
> > >> On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
> > >>> On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
> > >>>> Got it, this explains it, sorry for the noise on this.
> > >>>>
> > >>>> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
> > >>>
> > >>> BTW, consider measuring with the --bypass-cache flag to virsh save.
> > >>> This causes libvirt to use a I/O helper that uses O_DIRECT when
> > >>> saving the image. This should give more predictable results by
> > >>> avoiding the influence of host I/O cache which can be in a differnt
> > >>> state of usage each time you measure.  It was also intended that
> > >>> by avoiding hitting cache, saving the memory image of a large VM
> > >>> will not push other useful stuff out of host I/O  cache which can
> > >>> negatively impact other running VMs.
> > >>>
> > >>> Also it is possible to configure compression on the libvirt side
> > >>> which may be useful if you have spare CPU cycles, but your storage
> > >>> is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
> > >>>
> > >>> With regards,
> > >>> Daniel
> > >>>
> > >>
> > >> Hi Daniel, thanks for these good info,
> > >>
> > >> regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
> > >> (and still getting low bandwidth unfortunately) so I guess compression is out of the question.
> > > 
> > > What type of speeds do you get if you try a migrate to a netcat socket?
> > 
> > much faster apparently, 30 sec savevm vs 7 seconds for migration to a netcat socket sent to /dev/null.
> > 
> > nc -l -U /tmp/savevm.socket
> > 
> > virsh suspend centos7
> > Domain centos7 suspended
> > 
> > virsh qemu-monitor-command --cmd '{ "execute": "migrate", "arguments": { "uri": "unix:///tmp/savevm.socket" } }' centos7
> > 
> > virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
> > {"return":{"blocked":false,"status":"completed","setup-time":118,"downtime":257,"total-time":7524,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":1057530,"page-size":4096,"remaining":0,"mbps":24215.572437483122,"transferred":22417172290,"duplicate":2407520,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22351847424,"normal":5456994}},"id":"libvirt-438"}
> > 
> > virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
> > {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":8,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-439"}
> > 
> > 
> > I did also a run with multifd-channels:1 instead of 8, if it matters:
> 
> I suspect you haven't actually got multifd enabled ( check
> query-migrate-capabilities ?).
> > 
> > virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
> > {"return":{"blocked":false,"status":"completed","setup-time":119,"downtime":260,"total-time":8601,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":908820,"page-size":4096,"remaining":0,"mbps":21141.861157274227,"transferred":22415264188,"duplicate":2407986,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22349938688,"normal":5456528}},"id":"libvirt-453"}
> > 
> > virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
> > {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":1,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-454"}
> > 
> > 
> > Still we are in the 20 Gbps range, or around 2560 MiB/s, way faster than savevm which does around 600 MiB/s when the wind is in its favor..
> 
> Yeh that's what I'd hope for off a decent CPU; hmm there's not that much
> savevm specific is there?

BTW, quick clarification here.

IIUC, Claudio says the test is 'virsh save $VMNAME /some/file'. This
is *not* running 'savevm' at the QEMU level. So it is a bit misleading
refering to it as savevm in the thread here.

'virsh save' is simply wired up to the normal QEMU 'migrate' commands,
with libvirt giving QEMU a pre-opened FD, which libvirt processes the
other end of to write out to disk.

IOW, the performance delta is possibly on libvirt's side rather
than QEMU's.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


