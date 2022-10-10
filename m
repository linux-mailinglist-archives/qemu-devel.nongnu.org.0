Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096025F9F2B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:11:57 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsZY-0007Ci-0Y
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohsVp-0004Om-HI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohsVj-0000mE-EY
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665407278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAdoTZ1Tryu8lyrygK/N5VaE33XP3Tc6dHbk64mPVT8=;
 b=cunUOtEGUkDiH+C3Waqw8FnQZFcQrA3fj4EYhZV0L+EalnxGDPiXDV7kyYgKxZGHPf+6sI
 8ujHOjr6Yw2XHqbiFNsOhz5JO2qYKoqr1XVVu+/CSk0ewfJLKAnqJqD0Aze4yDtHUsATeM
 BgkNKtxe6Jq65pntji724X4OUixJC7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-ihxzGzBRPzev2GpIpyJ4Iw-1; Mon, 10 Oct 2022 09:07:57 -0400
X-MC-Unique: ihxzGzBRPzev2GpIpyJ4Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 308D5811E67;
 Mon, 10 Oct 2022 13:07:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C6D7C4C9D3;
 Mon, 10 Oct 2022 13:07:56 +0000 (UTC)
Date: Mon, 10 Oct 2022 14:07:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 28/54] configure: build ROMs with container-based cross
 compilers
Message-ID: <Y0QZKSHRDLlOHEgP@redhat.com>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-29-alex.bennee@linaro.org>
 <Y0QV+B+Wz6fxceh1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y0QV+B+Wz6fxceh1@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, Oct 10, 2022 at 01:54:16PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Oct 04, 2022 at 02:01:12PM +0100, Alex Benn=C3=A9e wrote:
> > From: Paolo Bonzini <pbonzini@redhat.com>
> >=20
> > s390-ccw remains a bit more complex, because the -march=3Dz900 test is =
done
> > only for the native cross compiler.  Otherwise, all that is needed is
> > to pass the (now mandatory) target argument to write_target_makefile.
> >=20
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>
>=20
> I'm not at all convinced this change was/is a good idea.
>=20
> First of all, it causes 'make' to now download about 1 GB of
> container images
>=20
>   $ ./configure --target-list=3Dx86_64-softmmu
>   $ make
>   ...snip...
>   BUILD   debian-powerpc-test-cross
>   Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-powerp=
c-test-cross:latest...
>   Getting image source signatures
>   Copying blob 2a205c8a1d36 [=3D>------------------------------------] 12=
=2E4MiB / 257.2MiB
>=20
>   ...
>   ...snip...
>  =20
> Despite downloading this image, it then proceeded to rebuild the
> image from scratch, requiring another few 100MBs of downloads
> of dpkgs. This time the download was without progress information
> until it entirely failed due to a dead Debia mirror server, needing
> a retry.

This failure seems worse than I realized.  It also failed on a
non-responsive mirror when re-building the s390 image. WHen I
re-ran 'make' it definitely did not retry the re-build process,
as 'BUILD debian-s390x-cross' was instantaneous. So it looks
like it is using the downloaded cached image, despite the previous
'make' apparently considering that to have been outdated content
needing a rebuild.

FWIW the  failure output was:

  BUILD   debian-s390x-cross
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cros=
s:latest...
Getting image source signatures
Copying blob fc8d65e34cd5 [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>--] 341.6MiB / 36=
0.2MiB
Copying blob fc8d65e34cd5 done =20
Copying blob bd159e379b3b skipped: already exists =20
Copying blob 13224e2971af done =20
Copying config 67a127f7cd done =20
Writing manifest to image destination
Storing signatures
debconf: delaying package configuration, since apt-utils is not installed
E: Failed to fetch http://deb.debian.org/debian/pool/main/s/systemd/systemd=
_247.3-7%2bdeb11u1_amd64.deb  400  Bad Request [IP: 199.232.122.132 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/p/perl/perl_5.32.=
1-4%2bdeb11u2_amd64.deb  Error reading from server - read (104: Connection =
reset by peer) [IP: 199.232.122.132 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fi=
x-missing?
Error: error building at STEP "RUN export DEBIAN_FRONTEND=3Dnoninteractive =
&&     apt-get update &&     apt-get install -y eatmydata &&     eatmydata =
apt-get dist-upgrade -y &&     eatmydata apt-get install --no-install-recom=
mends -y             bash             bc             bison             bsde=
xtrautils             bzip2             ca-certificates             ccache =
            dbus             debianutils             diffutils             =
exuberant-ctags             findutils             flex             gcovr   =
          genisoimage             gettext             git             hostn=
ame             libglib2.0-dev             libpcre2-dev             libspic=
e-protocol-dev             llvm             locales             make       =
      meson             ncat             ninja-build             openssh-cl=
ient             perl-base             pkgconf             python3         =
    python3-numpy             python3-opencv             python3-pillow    =
         python3-pip             python3-sphinx             python3-sphinx-=
rtd-theme             python3-venv             python3-yaml             rpm=
2cpio             sed             sparse             tar             tesser=
act-ocr             tesseract-ocr-eng             texinfo &&     eatmydata =
apt-get autoremove -y &&     eatmydata apt-get autoclean -y &&     sed -Ei =
's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen &&     dpkg-reconfigure local=
es": error while running runtime: exit status 100
Traceback (most recent call last):
  File "/home/berrange/src/virt/qemu/tests/docker/docker.py", line 683, in =
<module>
    sys.exit(main())
  File "/home/berrange/src/virt/qemu/tests/docker/docker.py", line 679, in =
main
    return args.cmdobj.run(args, argv)
  File "/home/berrange/src/virt/qemu/tests/docker/docker.py", line 493, in =
run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "/home/berrange/src/virt/qemu/tests/docker/docker.py", line 343, in =
build_image
    self._do_check(build_args,
  File "/home/berrange/src/virt/qemu/tests/docker/docker.py", line 247, in =
_do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib64/python3.10/subprocess.py", line 369, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['podman', 'build', '-t', 'qemu/deb=
ian-s390x-cross', '-f', '/tmp/docker_buildt03fabg5/tmp3xpdzx90.docker', '--=
cache-from', 'registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cross=
', '/tmp/docker_buildt03fabg5']' returned non-zero exit status 100.
make[1]: *** [/home/berrange/src/virt/qemu/tests/docker/Makefile.include:38=
: docker-image-debian-s390x-cross] Error 1
make[1]: Leaving directory '/home/berrange/src/virt/qemu/build'
make: *** [GNUmakefile:11: all] Error 2


With regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


