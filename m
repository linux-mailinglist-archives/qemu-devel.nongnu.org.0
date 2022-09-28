Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99A5ED9DD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:10:21 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odU1E-0005PP-6Z
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odRSa-0004jN-Ba
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odRSX-0001Fl-NP
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBbNqoztELtvWF8p6WNOH6N+rh4Jj3g7feYRTlljtkY=;
 b=hRrgCkTW2F40H85UgVXdcMK1+9/bXqietb6wjAPO/juZYIrYMRRT967k3WjaRDsGB30fiJ
 IVJA7bTqZpQJ7kl3vd7Dv1k8ebiv/z1YuuhjOe3OY0EHGNOz6FcMZ5KVptn/qyHvScrFR8
 UzIX9l6KhzD3UrpyrSi+1dxehcyPA8g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346--2nqAoapOdyvw7h838_QGQ-1; Wed, 28 Sep 2022 03:26:17 -0400
X-MC-Unique: -2nqAoapOdyvw7h838_QGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E923C0D191;
 Wed, 28 Sep 2022 07:26:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F438492B04;
 Wed, 28 Sep 2022 07:26:15 +0000 (UTC)
Date: Wed, 28 Sep 2022 08:26:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YzP3FejcbLU2k5WR@redhat.com>
References: <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <20220927171601-mutt-send-email-mst@kernel.org>
 <YzPwkqRexae1MjG/@redhat.com>
 <CAARzgwyw0TcNW_vbnDjXbDspCzT-jCfPPkHmsz-H+snoNt1=1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwyw0TcNW_vbnDjXbDspCzT-jCfPPkHmsz-H+snoNt1=1A@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 12:45:46PM +0530, Ani Sinha wrote:
> On Wed, Sep 28, 2022 at 12:28 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Sep 27, 2022 at 05:18:10PM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Sep 27, 2022 at 09:33:27AM +0100, Daniel P. Berrangé wrote:
> > > > On Tue, Sep 27, 2022 at 01:43:15PM +0530, Ani Sinha wrote:
> > > > > On Sun, Sep 18, 2022 at 1:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> > > > > > > On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On Mon, 25 Jul 2022, Ani Sinha wrote:
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > > > > > > > >
> > > > > > > > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > > > > > > > > >     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> > > > > > > > > > >     1"?
> > > > > > > > > > >     > > And if the directory exists I would fetch and checkout.
> > > > > > > > > > >     >
> > > > > > > > > > >     > There are two reasons I can think of why I do not like this idea:
> > > > > > > > > > >     >
> > > > > > > > > > >     > (a) a git clone of a whole directory would download all versions of the
> > > > > > > > > > >     > binary whereas we want only a specific version.
> > > > > > > > > > >
> > > > > > > > > > >     You mention shallow clone yourself, and I used --depth 1 above.
> > > > > > > > > > >
> > > > > > > > > > >     > Downloading a single file
> > > > > > > > > > >     > by shallow cloning or creating a git archive is overkill IMHO when a wget
> > > > > > > > > > >     > style retrieval works just fine.
> > > > > > > > > > >
> > > > > > > > > > >     However, it does not provide for versioning, tagging etc so you have
> > > > > > > > > > >     to implement your own schema.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> > > > > > > > > > > I think all we need to do is maintain the same versioning logic and maintain
> > > > > > > > > > > binaries of different  versions. Do we really need the power of git/version
> > > > > > > > > > > control here? Dunno.
> > > > > > > > > >
> > > > > > > > > > Well we need some schema. Given we are not using official bits releases
> > > > > > > > > > I don't think we can reuse theirs.
> > > > > > > > >
> > > > > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > > >
> > > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > > > > keep the binaries?
> > > > > > >
> > > > > > > Can we please conclude on this?
> > > > > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > > > > you on IRC but failed.
> > > > > >
> > > > > > Probably because of travel around KVM forum.
> > > > > >
> > > > > > I think given our CI is under pressure again due to gitlab free tier
> > > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > > Can Ani just upload binaies to qemu.org for now?
> > > > >
> > > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > > overkill IMHO. We should create a repo just for the binaries, have a
> > > > > README there to explain how we generate them and check in new versions
> > > > > as and when needed (it won't be frequent).
> > > > > How about biosbits-bin repo?
> > > >
> > > > If QEMU is hosting binaries, where any part contains GPL code, then we
> > > > need to be providing the full and corresponding source and the build
> > > > scripts needed to re-create the binary. Once we have such scripts it
> > > > should be trivial to trigger that from a CI job. If it isn't then
> > > > we're doing something wrong.  The CI quota is not an issue, because
> > > > this is not a job that we need to run continuously. It can be triggered
> > > > manually as & when we decide we need to refresh the binary, so would
> > > > be a small one-off CI quota hit.
> > > >
> > > > Also note that gitlab is intending to start enforcing storage quota
> > > > on projects in the not too distant future. This makes it unappealing
> > > > to store binaries in git repos, unless we genuinely need the ability
> > > > to access historical versions of the binary. I don't believe we need
> > > > that for biosbits.
> > > >
> > > > The binary can be published as a CI artifact and accessed directly
> > > > from the latest artifact download link. This ensures we only consume
> > > > quota for the most recently published binary artifact. So I don't see
> > > > a compelling reason to upload binaries into git.
> > >
> > > I don't really care where we upload them but only having the
> > > latest version is just going to break anything expecting
> > > the old binary.
> >
> > biosbits isn't tied to QEMU versions, it is an entirely separate 3rd
> > party project. This binary is just providing the test env, and IIUC,
> > control over what executes in this env is still done by the QEMU side
> > test scripts. I'm not seeing a coupling here that requires precise
> > matching. In any case biosbit is a dead project so does not look
> > likely to have any changes.
> >
> > If we did want to have different versions though, we can stil
> > publish artifacts from different branches of biosbits code.
> 
> No, that is just ridiculous. Say we have a bug in bits that we fixed
> and released a new version. Do we now create a new branch for that?
> Multiple branches makes things needlessly complicated. We have one
> branch, qemu-bits and all fixes go into that branch. We can have
> different tags if we need. Nothing beyond that.

I didn't mean we needed different branches for bug fixes. We would
only need different branches if biosbits framework changed in some
way that was incompatible with how QEMU used it previously. I find
that unlikely to happen given its a dead project. We'll almost
certainly be fine with one branch taking bug fixes. We do have the
option for multiple branches in the unlikely even we find we need
it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


