Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439884E2289
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:50:29 +0100 (CET)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDkC-0006EX-0H
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:50:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1nWDhG-0005Cm-7c
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1nWDhD-0007RQ-1l
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647852441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZrHVmrRj722lFqkcqUpPpWK61TfAajQthii1UC8BWcc=;
 b=it4Di3sWhPAUzE3+htgb/LADQBRAQJPNc5Y4jt0A2G0DM+ZseoHLIMskE5itoS54Miwslo
 Hi733U1IGxJJluEjUwdA6EIBzKI9H5Fsyw9cO3BxpCw3YuGs/XWCwIecOK/kn3JVfbwUR7
 oVsvhB0dzHQu6bpCEN+eTQsHwOlQJbk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-5TQUgMXYOUyGaLHebevdsA-1; Mon, 21 Mar 2022 04:46:14 -0400
X-MC-Unique: 5TQUgMXYOUyGaLHebevdsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84A6638025E7;
 Mon, 21 Mar 2022 08:46:14 +0000 (UTC)
Received: from [10.40.192.3] (unknown [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC3D40CF8F0;
 Mon, 21 Mar 2022 08:46:13 +0000 (UTC)
Message-ID: <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
Date: Mon, 21 Mar 2022 09:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
Content-Language: en-US
Autocrypt: addr=ldoktor@redhat.com; keydata=
 xsBNBFcV6vsBCADa8NUYov+a+AmCEEUB3stiiMM0NQc1WwlcxGoMxKHcqqIj/kdPhUDvFS32
 V94V7en1Lx+cpXKRMZP3n+3WG+VZWLwaktJgqrECZ161zE7xF5d1H3CLmwStbe6Cw1oR4LYQ
 HBpuqFEA5znoLuTTsP1uXs9h1cYNzX7hmOTvPCLJfDJ1iv954FsgCGtoVvl4CoxaR3u2VNOs
 hXsTTVyJM6gDTsyqn0uvLOHGWGIGVhDkLV4hv6pSdiKrtQKWIUji3Z8x41MbZybmJxHkpOVz
 Jl3jnNE3CbiEq77Is9LMI4yTF2CESs3V4XMBLfZPLrQBC0gzjeRxwCnbdOZRwY5KI457ABEB
 AAHNK0x1a2FzIERva3RvciAoUmVkIEhhdCkgPGxkb2t0b3JAcmVkaGF0LmNvbT7CwJUEEwEI
 AD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEF
 AmAzSoUFCQzmojUACgkQJrNi5H/PIsGM4Qf+OmO8PqPg28arBfxGSjdxb4744E1bnLESNudf
 8VY5/UEca0X65KW9L5vd6XUjusy2T4iyUcbZhCxYcHQLqP6y3AIyVfgJz91HEAt2thMFPfbj
 IhqVlyP0xEyvCNLk83M4PLN9IhugvSLce6R6cliETevP/m7RQSiP1o0fKu0uAUrEKWD9DZMF
 99BaI635YZOPHQwQlkWnFBEKpKLjkuKpn/QSkW34mkaByn6zLhF5QeIp/9FQVUZCeOy/zR0G
 s8ggfDyr4vJuDU4gI9NGZs6zycTflmFpA46P03LgmdRL/C6U7vbUB6B+v0YddYJoaarLUKpa
 L4dG8h/m8RdXNA33YM7ATQRXFer7AQgAw8JIK9pZUfZWNZirBIwOevkdZu1aLhgH84EfXw40
 ynMEFa1t/c0baOiuLNcVbdnHLGvUAQJ2oN/+rdGpEWITVSjDxFYf3JOnySZJhLnQgGMG4j3m
 dFZMubPG1GJEuubPAAB0huRfjQTvOvpIK03J2H5cMoug862OHOnT+mfonGruTkSO0PBq3wtf
 P+Z3gLCuEDkmEZSh4IKxs0CoLU4KxWRQHpoTOxcAiHzj8cm5qbu3Cb1KrXz8dEmYhCq2fpFf
 /h+GfEO8gU/ICJD8WQUHYcVK0bbiZskCcSOGtStjwq0QqitZMbcsPEset/2L3z44MLPuVApv
 c9wORs/3iT9BhwARAQABwsB8BBgBCAAmAhsMFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmAz
 So0FCQzmojUACgkQJrNi5H/PIsFS9Qf/WZ31JQQnQQSbmtm7IOAHYC7kvlQy8mejWlgeDrPW
 h3zQIXxiarBpAnYGsHNVOWJ+sjdELYc9bvOcGwXSRRxURArOYfkUOk4KmNmqd6eIrOvnFfap
 Lh0xRNx+9y0gYqB9TH/JaCLMPnH+jRGM0ZisNEHyXhemEXlXPy4vniEvajr4VnvFzD6gExzD
 jUqIel42BOOyHuXjZQDMEWf2eULSTGHTWXGdV2XErdS1v4YI/DGvQQPB29UHmb2RsZhKtntq
 0yoxFD60HzSHlVeiLmG/hAHLDY3dBs/GW3RJAbOVttS31llstDtdMEHLn+P81M4dVYzt5mEE
 NPy43Lf+YxM9FQ==
Subject: Re: Proposal for a regular upstream performance testing
In-Reply-To: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eGXUjeOldkH90P0UomAuf5Jp"
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eGXUjeOldkH90P0UomAuf5Jp
Content-Type: multipart/mixed; boundary="------------21MHUV4fghzsQ3qhqAr1CTah";
 protected-headers="v1"
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Charles Shih <cheshi@redhat.com>
Message-ID: <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
In-Reply-To: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>

--------------21MHUV4fghzsQ3qhqAr1CTah
Content-Type: multipart/mixed; boundary="------------BxC4plhPFB6rN1lTTnYFN0Jc"

--------------BxC4plhPFB6rN1lTTnYFN0Jc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear qemu developers,

you might remember the "replied to" email from a bit over year ago to rai=
se a discussion about a qemu performance regression CI. On KVM forum I pr=
esented https://www.youtube.com/watch?v=3DCbm3o4ACE3Y&list=3DPLbzoR-pLrL6=
q4ZzA4VRpy42Ua4-D2xHUR&index=3D9 some details about my testing pipeline. =
I think it's stable enough to become part of the official CI so people ca=
n consume, rely on it and hopefully even suggest configuration changes.

The CI consists of:

1. Jenkins pipeline(s) - internal, not available to developers, running d=
aily builds of the latest available commit
2. Publicly available anonymized results: https://ldoktor.github.io/tmp/R=
edHat-Perf-worker1/
3. (optional) a manual gitlab pulling job which triggered by the Jenkins =
pipeline when that particular commit is checked

The (1) is described here: https://run-perf.readthedocs.io/en/latest/jenk=
ins.html and can be replicated on other premises and the individual jobs =
can be executed directly https://run-perf.readthedocs.io on any linux box=
 using Fedora guests (via pip or container https://run-perf.readthedocs.i=
o/en/latest/container.html ).

As for the (3) I made a testing pipeline available here: https://gitlab.c=
om/ldoktor/qemu/-/pipelines with one always-passing test and one allow-to=
-fail actual testing job. If you think such integration would be useful, =
I can add it as another job to the official qemu repo. Note the integrati=
on is a bit hacky as, due to resources, we can not test all commits but r=
ather test on daily basis, which is not officially supported by gitlab.

Note the aim of this project is to ensure some very basic system-level wo=
rkflow performance stays the same or that the differences are described a=
nd ideally pinned to individual commits. It should not replace thorough r=
elease testing or low-level performance tests.

Regards,
Luk=C3=A1=C5=A1


Dne 26. 11. 20 v 9:10 Luk=C3=A1=C5=A1 Doktor napsal(a):
> Hello guys,
>=20
> I had been around qemu on the Avocado-vt side for quite some time and a=
 while ago I shifted my focus on performance testing. Currently I am not =
aware of any upstream CI that would continuously monitor the upstream qem=
u performance and I'd like to change that. There is a lot to cover so ple=
ase bear with me.
>=20
> Goal
> =3D=3D=3D=3D
>=20
> The goal of this initiative is to detect system-wide performance regres=
sions as well as improvements early, ideally pin-point the individual com=
mits and notify people that they should fix things. All in upstream and i=
deally with least human interaction possible.
>=20
> Unlike the recent work of Ahmed Karaman's https://ahmedkrmn.github.io/T=
CG-Continuous-Benchmarking/ my aim is on the system-wide performance insi=
de the guest (like fio, uperf, ...)
>=20
> Tools
> =3D=3D=3D=3D=3D
>=20
> In house we have several different tools used by various teams and I be=
t there are tons of other tools out there that can do that. I can not spe=
ak for all teams but over the time many teams at Red Hat have come to lik=
e pbench https://distributed-system-analysis.github.io/pbench/ to run the=
 tests and produce machine readable results and use other tools (Ansible,=
 scripts, ...) to provision the systems and to generate the comparisons.
>=20
> As for myself I used python for PoC and over the last year I pushed har=
d to turn it into a usable and sensible tool which I'd like to offer: htt=
ps://run-perf.readthedocs.io/en/latest/ anyway I am open to suggestions a=
nd comparisons. As I am using it downstream to watch regressions I do pla=
n on keep developing the tool as well as the pipelines (unless a better t=
ool is found that would replace it or it's parts).
>=20
> How
> =3D=3D=3D
>=20
> This is a tough question. Ideally this should be a standalone service t=
hat would only notify the author of the patch that caused the change with=
 a bunch of useful data so they can either address the issue or just be a=
ware of this change and mark it as expected.
>=20
> Ideally the community should have a way to also issue their custom buil=
ds in order to verify their patches so they can debug and address issues =
better than just commit to qemu-master.
>=20
> The problem with those is that we can not simply use travis/gitlab/... =
machines for running those tests, because we are measuring in-guest actua=
l performance. We can't just stop the time when the machine decides to sc=
hedule another container/vm. I briefly checked the public bare-metal offe=
rings like rackspace but these are most probably not sufficient either be=
cause (unless I'm wrong) they only give you a machine but it is not guara=
nteed that it will be the same machine the next time. If we are to compar=
e the results we don't need just the same model, we really need the very =
same machine. Any change to the machine might lead to a significant diffe=
rence (disk replacement, even firmware update...).
>=20
> Solution 1
> ----------
>=20
> Doing this for downstream builds I can start doing this for upstream as=
 well. At this point I can offer a single pipeline watching only changes =
in qemu (downstream we are checking distro/kernel changes as well but tha=
t would require too much time at this point) on a single x86_64 machine. =
I can not offer a public access to the testing machine, not even checking=
 custom builds (unless someone provides me a publicly available machine(s=
) that I would use for this). What I can offer is running the checks on t=
he latest qemu master, publishing the reports, bisecting issues and notif=
ying people about the changes. An example of a report can be found here: =
https://drive.google.com/file/d/1V2w7QpSuybNusUaGxnyT5zTUvtZDOfsb/view?us=
p=3Dsharing a documentation of the format is here: https://run-perf.readt=
hedocs.io/en/latest/scripts.html#html-results I can also attach the raw p=
bench results if needed (as well as details about the tests that were exe=
cuted and the params and other details).
>=20
> Currently the covered scenarios would be a default libvirt machine with=
 qcow2 storage and tuned libvirt machine (cpus, hugepages, numa, raw disk=
=2E..) running fio, uperf and linpack on the latest GA RHEL. In the futur=
e I can add/tweak the scenarios as well as tests selection based on your =
feedback.
>=20
> Solution 2
> ----------
>=20
> I can offer a documentation: https://run-perf.readthedocs.io/en/latest/=
jenkins.html and someone can fork/inspire by it and setup the pipelines o=
n their system, making it available to the outside world, add your custom=
 scenarios and variants. Note the setup does not require Jenkins, it's ju=
st an example and could be easily turned into a cronjob or whatever you c=
hose.
>=20
> Solution 3
> ----------
>=20
> You name it. I bet there are many other ways to perform system-wide per=
formance testing.
>=20
> Regards,
> Luk=C3=A1=C5=A1

--------------BxC4plhPFB6rN1lTTnYFN0Jc
Content-Type: application/pgp-keys; name="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
8/rqvLjMTzM6tdemLxcoLF6iT4FhmF9/QXWrBLLK/xgAR6oCmOeHbU3TJxWWRVaM
JKAkodgJf1/zkpOcKcmGaxGHijTCwJQEEwEIAD8CGwMGCwkIBwMCBhUIAgkKCwQW
AgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAl4caiwFCQsFbrUACgkQ
JrNi5H/PIsErWAf2OeTv2KSo5ukikdSA/iNItDXqqMhgrN0JbMadb82VYKKCFP+N
XQy26NQqcKjaJlmv1Q4rYDfLvz+1gvnir6l9gg47g/EPC5s2UxGOlGz8fzgHcHne
02PFEUKCNSlSZTJW8DCwFKN4VkPGqungJvDd9i8gC9B/TB3HH4IHr82mA3BnQ3wm
l9KHKXRoEJVR15cd6kKU55MRG0mq6VzYnW5Wwyxf0ZC6+R2tQgzxsvxRVPvQXSbc
Gv3kWoPgRo5a8IWzMB194tWVYNaqhMUPKZsgBUGF3JdzrwgDBAuC16mKgyMDrzH3
X0ZZ3TXH+mQBXu/px5L8BMz/WAibkjPVTeqe0c8Bzv8BEAABAQAAAAAAAAAAAAAA
AP/Y/+AAEEpGSUYAAQEAAAEAAQAA/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZ
EhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJ
CQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIy/8AAEQgAkgB7AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEB
AAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUS
ITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5
OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeY
mZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq
8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALUR
AAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1Lw
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3D
=3DKNPg
-----END PGP PUBLIC KEY BLOCK-----

--------------BxC4plhPFB6rN1lTTnYFN0Jc--

--------------21MHUV4fghzsQ3qhqAr1CTah--

--------------eGXUjeOldkH90P0UomAuf5Jp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmI4O1QFAwAAAAAACgkQJrNi5H/PIsEG
+Qf/d/czPDcE4lyTvbRXK3zSziR3EICIu/U1RwDtNnoHik8krh7/kO0J7rpfxqObYOq0xogUpaMv
W1ttM8MOdOtpDx96fAyTlSuBNWnA5CFpn9HkFizP4WyJWU178ACw0vPwwisl5abINwWnW+WUWyNT
dBS50BJ+vdasLmDo67HkGy6pjjYcfmUDj7rkmyFk/pfUKBYOOfnqvyVLyVbT5kkPJnQwEU73eTRb
2Wx01eW0kuxuy/TJouXP9HANPaJyslG0vc9d6/e7Qe2hIFomnc/SAWXbNZXDcuElCxrPEwFyc+bC
uOXgmzJCwQB7m8jQGU0rBmsdkASyz8F+Y1xNW4zccg==
=p4Cy
-----END PGP SIGNATURE-----

--------------eGXUjeOldkH90P0UomAuf5Jp--


