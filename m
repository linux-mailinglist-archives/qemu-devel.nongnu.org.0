Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546137A848
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:58:12 +0200 (CEST)
Received: from localhost ([::1]:47444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgStn-0006dK-CP
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgSrJ-0003tB-KU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgSrC-0000vw-Ga
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0z4hE+M0ZmqHNhVv6EKEUVW3mqibOA/X6rZWlp6Gqa8=;
 b=PQ41CIHhrQacZ2YVWeIW1j0ua22BmkEJEmAaEuojI5RYRue/p5NoDI7cWhcLNpSh5ZzjR5
 Zw8D++hCod1HqzR3NS2SiGgUKEzpk/Dx05Yflg3PNddCefCxd8fukfSnMPTFiVjoWVF21V
 E9QJQIu0rSY3m0Q1URst7xamXtmn6cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-fe-Q-ZLVMzaDcsIP43JOLg-1; Tue, 11 May 2021 09:55:25 -0400
X-MC-Unique: fe-Q-ZLVMzaDcsIP43JOLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36DB41009600;
 Tue, 11 May 2021 13:55:24 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB6FB3807;
 Tue, 11 May 2021 13:55:23 +0000 (UTC)
Date: Tue, 11 May 2021 14:55:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
Message-ID: <YJqMytvO4TNNYL0O@stefanha-x1.localdomain>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
 <YH1QJZGYQXc6x9Et@redhat.com> <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
 <YH1gtK/JFtVE4lF1@redhat.com>
 <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
 <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I7Rd5P7ZTQJ0JFFC"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--I7Rd5P7ZTQJ0JFFC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 08:48:44AM +0200, Philippe Mathieu-Daud=E9 wrote:
> +Stefan/Peter
>=20
> On 4/19/21 12:59 PM, Thomas Huth wrote:
> > On 19/04/2021 12.51, Daniel P. Berrang=E9 wrote:
> >> On Mon, Apr 19, 2021 at 12:48:25PM +0200, Thomas Huth wrote:
> >>> On 19/04/2021 12.36, Daniel P. Berrang=E9 wrote:
> >>>> On Mon, Apr 19, 2021 at 12:20:55PM +0200, Thomas Huth wrote:
> >>>>> On 19/04/2021 12.10, Erik Skultety wrote:
> >>>>>> On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrang=E9 wro=
te:
> >>>>>>> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daud=
=E9
> >>>>>>> wrote:
> >>>>>>>> Forks run the same jobs than mainstream, which might be overkill=
.
> >>>>>>>> Allow them to easily rebase their custom set, while keeping usin=
g
> >>>>>>>> the mainstream templates, and ability to pick specific jobs from
> >>>>>>>> the mainstream set.
> >>>>>>>>
> >>>>>>>> To switch to your set, simply add your .gitlab-ci.yml as
> >>>>>>>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where
> >>>>>>>> CI_PROJECT_NAMESPACE
> >>>>>>>> is your gitlab 'namespace', usually username). This file will be
> >>>>>>>> used instead of the default mainstream set.
> >>>>>>>
> >>>>>>> I find this approach undesirable, because AFAICT, it means you ha=
ve
> >>>>>>> to commit this extra file to any of your downstream branches that
> >>>>>>> you want this to be used for.=A0 Then you have to be either delet=
e it
> >>>>>>> again before sending patches upstream, or tell git-publish to
> >>>>>>> exclude the commit that adds this.
> >>>>>>>
> >>>>>>> IMHO any per-contributor overhead needs to not involve committing
> >>>>>>> stuff to their git branches, that isn't intended to go upstream.
> >>>>>>
> >>>>>> Not just that, ideally, they should also run all the upstream
> >>>>>> workloads before
> >>>>>> submitting a PR or posting patches because they'd have to respin
> >>>>>> because of a
> >>>>>> potential failure in upstream pipelines anyway.
> >>>>>
> >>>>> It's pretty clear that you want to run the full QEMU CI before
> >>>>> submitting
> >>>>> patches to the QEMU project, but I think we are rather talking
> >>>>> about forks
> >>>>> here that are meant not meant for immediately contributing to upstr=
eam
> >>>>> again, like RHEL where we only build the KVM-related targets and
> >>>>> certainly
> >>>>> do not want to test other things like CPUs that are not capable of
> >>>>> KVM, or a
> >>>>> branch where Philippe only wants to check his MIPS-related work dur=
ing
> >>>>> development.
> >>>>> For contributing patches to upstream, you certainly have to run the
> >>>>> full CI,
> >>>>> but for other things, it's sometimes really useful to cut down the =
CI
> >>>>> machinery (I'm also doing this in my development branches manually
> >>>>> some
> >>>>> times to speed up the CI), so I think this series make sense, indee=
d.
> >>>>
> >>>> For a downstream like RHEL, I'd just expect them to replace the main
> >>>> .gitlab-ci.yml entirely to suit their downstream needs.
> >>>
> >>> But that still means that we should clean up the main .gitlab-ci.yml
> >>> file
> >>> anyway, like it is done in this series, to avoid that you always get
> >>> conflicts in this big file with your downstream-only modifications.
> >>> So at
> >>> least up to patch 11 or 12, I think this is a very valuable work that
> >>> Philippe is doing here.
> >>
> >> I don't see a real issue with downstream conflicts. They'll just
> >> periodically pick a release to base themselves off and change once
> >> every 6 months or more.
> >=20
> > It's not only downstream distros that rebase every 6 month. Like
> > Philippe, I'm sometimes hacking my .gitlab-ci.yml of my development
> > branch to speed up the CI during my development cycles (i.e. I'm
> > removing the jobs that I do not need). And I'm regularly rebasing my
> > development branchs. Conflicts in .gitlab-ci.yml are then always
> > painful, so a leaner main .gitlab-ci.yml file would be helpful for me,
> > too, indeed.
>=20
> Not sure if following up this thread or start a new one, but I got
> blocked again from Gitlab, tagged as a crypto miner for running QEMU
> CI...
> [1]
> https://about.gitlab.com/handbook/support/workflows/investigate_blocked_p=
ipeline.html#trends--high-priority-cases
>=20
> I pushed 5 different branches to my repository in less than 1h,
> kicking 580 jobs [*].
>=20
> I didn't try to stress Gitlab, it was a simple "one time in the month
> rebase unmerged branches, push them before respining on the mailing
> list".
>=20
> I'm considering changing my workflow:
> - not push more than 2 branches per hour (I know 3/h works, so choose
>   a lower number, as we want to add more tests).
> - merge multiple branches locally and push the merged result and
>   bisect / re-push on failure
> - run less testing
> - do not run testing
>=20
> This sounds counter productive and doesn't scale to a community of
> contributors asked to use Gitlab.
>=20
> So far I don't have better idea than this series.
>=20
> Who is interested in sending patches to improve our workflow?
>=20
> Thanks,
>=20
> Phil.
>=20
> [*] NB I have 3 extra runners added to my namespace, but it didn't
> help, as per [1] I got blocked by reaching an API rate limit.

The easiest short-term workaround seems to be disabling testing when you
push certain branches.

In the long term I think GitLab CI should allow unlimited jobs on
dedicated runners. It may be necessary to get in touch with GitLab
support and figure out how to stop it blocking dedicated runner jobs.

Stefan

--I7Rd5P7ZTQJ0JFFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCajMoACgkQnKSrs4Gr
c8gfoggAv3rfC0kH4iSCfSV+2Ir0ZVh1lUE80iJY1qP9nDbz7EjY8JQgs6L55+hO
atC+Od1SSJ6BX/Z3D86erYAe9hHbi8m40B1M6mWkSJGFjsIX7UoBPC/afw95pEbC
cyxYci5I/a9T+kFdGgLgN3+oculiGgq8w+s5Eixoyfhjr8DaPPlk98a7la5tU5pL
eabtWF++YzhcAA96yyjSmBQvNXcuBrkGVTmjpuWBLB5ZIaz3U3BmUZSg9Wn2MVEJ
wJOXvbW7HF3DDYYy0/kbNMhjeY/Pxo7JU4DXGiTdRJ81XKbhhJtax7t7IjUhp3a+
42rYp+jvd60JPHqY4mvqoscEt/a9bg==
=5Pcn
-----END PGP SIGNATURE-----

--I7Rd5P7ZTQJ0JFFC--


