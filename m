Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9A5ED69F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:44:24 +0200 (CEST)
Received: from localhost ([::1]:45496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRjz-00083Y-Dq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odRIf-0007wL-2A
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:16:20 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odRIa-00087h-9b
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:16:08 -0400
Received: by mail-il1-x12d.google.com with SMTP id a4so6227745ilj.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=80kz/I7mONMlFjEKIg8oC2ByaU8X9tNjRTYy/AnvR1I=;
 b=HPYVI7n4m6qyJj9bJtU9LHjx0+yormmGdystIts3Fe3ZtG0g/66R4GiFfJKSDsG+ox
 ffEgt5Kfllo6L0P/UGEHY/YqYAv3T0FRW/xyziUVX362cmz1AbZFAlzBApj7EGS+7oOX
 GBT5MdXod6MZiRlazPw1IENaKocND4yiz0lap7UVn3hZL8nhmNhQPP2B8TuITbFZEsmm
 e1z8R1ugL9WIPbszqeVug6fJW102pFuO0zosMxIOq3IwCEeF8H22YJt84/ka0qGHiUYN
 3GvRzNjOnxu2hME49k5JmMc99fIZXA9pWxWoN+Xyc09FVLCckraMktAT/dHYqvgYwGnW
 LB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=80kz/I7mONMlFjEKIg8oC2ByaU8X9tNjRTYy/AnvR1I=;
 b=uWVfzF83YaBBEoDU9329mosuY7QfBwjkHAtcYHEFUKpZ4f02sBwSQuVmx5U9ccgxBT
 Jnr/IDfCEou81nVN2vFNna602WxLj+c6sgL3x1uwgMzL9mx+FLoULRlVQkl3hkFcPzte
 9Q8R8i5XPud5CkkTIuDOkhGBpfh2Li0ytwvrTUrSRvEtiz0P52wklzwgFSFQWmkQT46m
 Sww0y5sdJXK+ZFqxMFo6Kx2PeZeZOLd+Zaj3tbWZiur0VHTS/8FfvOVfYzSttnqbr1v6
 DZEn5Ha2Ss6kjgGyC+Kb0GtzH/U2TxL4eSCXT3vGrHVenYkipfttDyShrOo6pQUeBzKq
 Qmug==
X-Gm-Message-State: ACrzQf0HQXHBhNyqrGRWKa9oL/uBCvnJ4EPlSr4tRUxcuYkD/e2LZmLo
 rYOhsdMegVZpym+gZz88/vbu5yYpwyo5QgN/FFIMrw==
X-Google-Smtp-Source: AMsMyM7eqAbWlILpp1tbXeDynzGb23noPaIlPPNNMrtjh+puQGZd+7GiJwRCRbZVGdFt3pPQNAFGePRpoQGqgm9PEAs=
X-Received: by 2002:a05:6e02:1a84:b0:2f6:2bba:8b60 with SMTP id
 k4-20020a056e021a8400b002f62bba8b60mr14700221ilv.129.1664349361993; Wed, 28
 Sep 2022 00:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com> <20220927171601-mutt-send-email-mst@kernel.org>
 <YzPwkqRexae1MjG/@redhat.com>
In-Reply-To: <YzPwkqRexae1MjG/@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 28 Sep 2022 12:45:46 +0530
Message-ID: <CAARzgwyw0TcNW_vbnDjXbDspCzT-jCfPPkHmsz-H+snoNt1=1A@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 12:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Tue, Sep 27, 2022 at 05:18:10PM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 27, 2022 at 09:33:27AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Tue, Sep 27, 2022 at 01:43:15PM +0530, Ani Sinha wrote:
> > > > On Sun, Sep 18, 2022 at 1:58 AM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
> > > > >
> > > > > On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> > > > > > On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wr=
ote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Mon, 25 Jul 2022, Ani Sinha wrote:
> > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > > > > > > >
> > > > > > > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote=
:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha=
 wrote:
> > > > > > > > > >     > > Instead of all this mess, can't we just spawn e=
.g. "git clone --depth
> > > > > > > > > >     1"?
> > > > > > > > > >     > > And if the directory exists I would fetch and c=
heckout.
> > > > > > > > > >     >
> > > > > > > > > >     > There are two reasons I can think of why I do not=
 like this idea:
> > > > > > > > > >     >
> > > > > > > > > >     > (a) a git clone of a whole directory would downlo=
ad all versions of the
> > > > > > > > > >     > binary whereas we want only a specific version.
> > > > > > > > > >
> > > > > > > > > >     You mention shallow clone yourself, and I used --de=
pth 1 above.
> > > > > > > > > >
> > > > > > > > > >     > Downloading a single file
> > > > > > > > > >     > by shallow cloning or creating a git archive is o=
verkill IMHO when a wget
> > > > > > > > > >     > style retrieval works just fine.
> > > > > > > > > >
> > > > > > > > > >     However, it does not provide for versioning, taggin=
g etc so you have
> > > > > > > > > >     to implement your own schema.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Hmm I=E2=80=99m not sure if we need all that. Bits has =
its own versioning mechanism and
> > > > > > > > > > I think all we need to do is maintain the same versioni=
ng logic and maintain
> > > > > > > > > > binaries of different  versions. Do we really need the =
power of git/version
> > > > > > > > > > control here? Dunno.
> > > > > > > > >
> > > > > > > > > Well we need some schema. Given we are not using official=
 bits releases
> > > > > > > > > I don't think we can reuse theirs.
> > > > > > > >
> > > > > > > > OK fine. Lets figuire out how to push bits somewhere in git=
.qemu.org and
> > > > > > > > the binaries in some other repo first. Everything else hing=
es on that. We
> > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > >
> > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where =
and how to
> > > > > > > keep the binaries?
> > > > > >
> > > > > > Can we please conclude on this?
> > > > > > Peter, can you please fork the repo? I have tried many times to=
 reach
> > > > > > you on IRC but failed.
> > > > >
> > > > > Probably because of travel around KVM forum.
> > > > >
> > > > > I think given our CI is under pressure again due to gitlab free t=
ier
> > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > Can Ani just upload binaies to qemu.org for now?
> > > >
> > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > overkill IMHO. We should create a repo just for the binaries, have =
a
> > > > README there to explain how we generate them and check in new versi=
ons
> > > > as and when needed (it won't be frequent).
> > > > How about biosbits-bin repo?
> > >
> > > If QEMU is hosting binaries, where any part contains GPL code, then w=
e
> > > need to be providing the full and corresponding source and the build
> > > scripts needed to re-create the binary. Once we have such scripts it
> > > should be trivial to trigger that from a CI job. If it isn't then
> > > we're doing something wrong.  The CI quota is not an issue, because
> > > this is not a job that we need to run continuously. It can be trigger=
ed
> > > manually as & when we decide we need to refresh the binary, so would
> > > be a small one-off CI quota hit.
> > >
> > > Also note that gitlab is intending to start enforcing storage quota
> > > on projects in the not too distant future. This makes it unappealing
> > > to store binaries in git repos, unless we genuinely need the ability
> > > to access historical versions of the binary. I don't believe we need
> > > that for biosbits.
> > >
> > > The binary can be published as a CI artifact and accessed directly
> > > from the latest artifact download link. This ensures we only consume
> > > quota for the most recently published binary artifact. So I don't see
> > > a compelling reason to upload binaries into git.
> >
> > I don't really care where we upload them but only having the
> > latest version is just going to break anything expecting
> > the old binary.
>
> biosbits isn't tied to QEMU versions, it is an entirely separate 3rd
> party project. This binary is just providing the test env, and IIUC,
> control over what executes in this env is still done by the QEMU side
> test scripts. I'm not seeing a coupling here that requires precise
> matching. In any case biosbit is a dead project so does not look
> likely to have any changes.
>
> If we did want to have different versions though, we can stil
> publish artifacts from different branches of biosbits code.

No, that is just ridiculous. Say we have a bug in bits that we fixed
and released a new version. Do we now create a new branch for that?
Multiple branches makes things needlessly complicated. We have one
branch, qemu-bits and all fixes go into that branch. We can have
different tags if we need. Nothing beyond that.

Gitlab
> will preserve & publish the latest artifacts from each branch in
> parallel.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

