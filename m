Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B529301B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 22:56:43 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUcCv-00058E-Qb
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 16:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUcBP-0004Tw-Lw
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUcBL-0006vV-Uf
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603140902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcjJXbXvNuuuStoyY6qsvbAdLqa4ypwqXB3OGBkeJaw=;
 b=Cfntzbp/AWsjm10o8AvEZafZFRGbPx1CdpFSqHUHL+gQ37ZIpSe2deT85sxgnKk+0yg0zM
 Bm0Y7rMtONRnNNJzD/2cp/nIknix6jmKxscWN3HRP4O52Mt4sSY8Q4BS0pGnaqiu5h88+G
 6+FF7T/fsU7xvwv8+gRVYZdde6hkBkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-XhFHNQi5N2mthRnVMvQmGg-1; Mon, 19 Oct 2020 16:54:58 -0400
X-MC-Unique: XhFHNQi5N2mthRnVMvQmGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE071101963A;
 Mon, 19 Oct 2020 20:54:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE9455784;
 Mon, 19 Oct 2020 20:54:52 +0000 (UTC)
Date: Mon, 19 Oct 2020 16:54:50 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Erik Skultety <eskultet@redhat.com>
Subject: Re: [PATCH v4 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
Message-ID: <20201019205450.GD1617151@localhost.localdomain>
References: <20201019015003.1527746-1-crosa@redhat.com>
 <20201019015003.1527746-4-crosa@redhat.com>
 <20201019102610.GB495479@nautilus>
MIME-Version: 1.0
In-Reply-To: <20201019102610.GB495479@nautilus>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 15:28:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 12:26:10PM +0200, Erik Skultety wrote:
> On Sun, Oct 18, 2020 at 09:50:02PM -0400, Cleber Rosa wrote:
> > +
> > +    - name: Checks the availability of official gitlab-runner builds i=
n the archive
> > +      uri:
> > +        url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitl=
ab_runner_version  }}/binaries/gitlab-runner-linux-386
> > +        method: HEAD
> > +        status_code:
> > +          - 200
> > +          - 403
>=20
> Why is 403 an acceptable success status code?
>

I missed this question in my last reply, sorry.

s3 will throw a 403 if the URI doesn't exist... and we don't want to fail
the playbook because of that, given that we'll attempt the fallback
repo defined in vars.yml{,.template}.

> > +      register: gitlab_runner_available_archive
> > +
> > +    - name: Update base url
> > +      set_fact:
> > +        gitlab_runner_base_url: https://s3.amazonaws.com/gitlab-runner=
-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-
> > +      when: gitlab_runner_available_archive.status =3D=3D 200
> > +    - debug:
> > +        msg: Base gitlab-runner url is {{ gitlab_runner_base_url  }}
> > +
> > +    - name: Set OS name (FreeBSD)
> > +      set_fact:
> > +        gitlab_runner_os: freebsd
> > +      when: "ansible_facts['system'] =3D=3D 'FreeBSD'"
> > +
> > +    - name: Create a group for the gitlab-runner service
> > +      group:
> > +        name: gitlab-runner
> > +
> > +    - name: Create a user for the gitlab-runner service
> > +      user:
> > +        user: gitlab-runner
> > +        group: gitlab-runner
> > +        comment: GitLab Runner
> > +        home: /home/gitlab-runner
> > +        shell: /bin/bash
> > +
> > +    - name: Remove the .bash_logout file when on Ubuntu systems
> > +      file:
> > +        path: /home/gitlab-runner/.bash_logout
> > +        state: absent
> > +      when: "ansible_facts['distribution'] =3D=3D 'Ubuntu'"
> > +
> > +    - name: Downloads the matching gitlab-runner
> > +      get_url:
> > +        dest: /usr/local/bin/gitlab-runner
> > +        url: "{{ gitlab_runner_base_url }}{{ gitlab_runner_os }}-{{ gi=
tlab_runner_arch }}"
> > +        owner: gitlab-runner
> > +        group: gitlab-runner
> > +        mode: u=3Drwx,g=3Drwx,o=3Drx
> > +

Here, the actual download is performed, and no 40x is considered OK.
I hope that explains it.

Cheers,
- Cleber.

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+N/RYACgkQZX6NM6Xy
CfNJShAAixqRyo8ZorHapPvhbofp4KSWevTzsL1iObrCYPV5o1rNOGsO8er+ML3z
T/AtCvbAtpdRDU7nr8LdbXonHhuQC0LcNs6stvx4HQabWpi/cZPQEJX+QSoa2Dzp
fuyCL/ybhJq2NmtRB9QfzS40zGk62BQyc1KlPEQIE7mf+Dx+11AdgFWu/gh27eN9
JUut3yaLCSYbcjrTPphnhYZRiTb8mQfLN/tE2cmymhOR9nMjUn2OoQfw6+rb57+m
lWjYBtM4SJkQTopROQm6U9KQsBhfb1+wrdY5tXPWRmdVi3c43R0A6sPsdppw2jRH
nFiNLUGxvFySDRHnQPRs2dsYYHES09/gHKa+jWcClb97hb524iAMOp+4BAm8q80D
fRQZkfqWFqbndwPljFYoTSxZasf0ZV3muV9TjRaipQ5+sic3Nt+dzT7LqQYiRQzY
/tpgr15yjwHs/rSw32oVpZrHdVILJpaPzg8Jgp2MQVo5jj4l8GUZYOv+fIB+vPuQ
iqM0EFWCAfOSh855g4mXFs1ENIi/K9ltScZuTlEP6khrzhUowKCKiJP8NrjNpGyL
I/UtN1GWgCd/dAiglyR/wzV2e+zyvUqOdhl1uNpuU9uQR82VCSbEyQgzJ3emZJoB
l9+OcKTntWeBKOFwAhiryxGFiDk/mNObAASRAfTS/rZwspA1ao0=
=d2Hu
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--


