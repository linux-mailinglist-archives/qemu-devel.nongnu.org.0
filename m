Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95E30B054
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:27:35 +0100 (CET)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6erG-0008G7-Jg
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6eqL-0007pz-Hx
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:26:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6eqF-0000Qq-KT
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:26:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 18E05816AD31;
 Mon,  1 Feb 2021 20:26:27 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Feb 2021
 20:26:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005782f93e8-3b80-472f-b8a7-79855e378ac1,
 A925A526D972EDC30A5527F39256541BB2C63354) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Feb 2021 20:26:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210201202625.7559f17a@bahia.lan>
In-Reply-To: <20210201171440.GA180539@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <20210128184416.4dbdd23b@bahia.lan>
 <20210201171440.GA180539@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+0o=LGwsQ8Q=Ov3.OcpdNju";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: b571bf33-25af-46ed-9810-d09c1d244132
X-Ovh-Tracer-Id: 6188508838188653045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgiesrghlgihurdgtrg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/+0o=LGwsQ8Q=Ov3.OcpdNju
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Feb 2021 17:14:40 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Jan 28, 2021 at 06:44:16PM +0100, Greg Kurz wrote:
> > On Wed, 27 Jan 2021 11:21:31 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > A well-behaved FUSE client does not attempt to open special files with
> > > FUSE_OPEN because they are handled on the client side (e.g. device no=
des
> > > are handled by client-side device drivers).
> > >=20
> > > The check to prevent virtiofsd from opening special files is missing =
in
> > > a few cases, most notably FUSE_OPEN. A malicious client can cause
> > > virtiofsd to open a device node, potentially allowing the guest to
> > > escape. This can be exploited by a modified guest device driver. It is
> > > not exploitable from guest userspace since the guest kernel will hand=
le
> > > special files inside the guest instead of sending FUSE requests.
> > >=20
> > > This patch adds the missing checks to virtiofsd. This is a short-term
> > > solution because it does not prevent a compromised virtiofsd process
> > > from opening device nodes on the host.
> > >=20
> > > Reported-by: Alex Xu <alex@alxu.ca>
> > > Fixes: CVE-2020-35517
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > > v3:
> > >  * Protect lo_create() [Greg]
> > > v2:
> > >  * Add doc comment clarifying that symlinks are traversed client-side
> > >    [Daniel]
> > >=20
> > > This issue was diagnosed on public IRC and is therefore already known
> > > and not embargoed.
> > >=20
> > > A stronger fix, and the long-term solution, is for users to mount the
> > > shared directory and any sub-mounts with nodev, as well as nosuid and
> > > noexec. Unfortunately virtiofsd cannot do this automatically because
> > > bind mounts added by the user after virtiofsd has launched would not =
be
> > > detected. I suggest the following:
> > >=20
> > > 1. Modify libvirt and Kata Containers to explicitly set these mount
> > >    options.
> > > 2. Then modify virtiofsd to check that the shared directory has the
> > >    necessary options at startup. Refuse to start if the options are
> > >    missing so that the user is aware of the security requirements.
> > >=20
> > > As a bonus this also increases the likelihood that other host process=
es
> > > besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> > > malicious guest cannot drop these files in place and then arrange for=
 a
> > > host process to come across them.
> > >=20
> > > Additionally, user namespaces have been discussed. They seem like a
> > > worthwhile addition as an unprivileged or privilege-separated mode
> > > although there are limitations with respect to security xattrs and the
> > > actual uid/gid stored on the host file system not corresponding to the
> > > guest uid/gid.
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 104 ++++++++++++++++++++++-------=
--
> > >  1 file changed, 74 insertions(+), 30 deletions(-)
> > >=20
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passt=
hrough_ll.c
> > > index 5fb36d9407..054ad439a5 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -555,6 +555,30 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
> > >      return fd;
> > >  }
> > > =20
> > > +/*
> > > + * Open a file descriptor for an inode. Returns -EBADF if the inode =
is not a
> > > + * regular file or a directory. Use this helper function instead of =
raw
> > > + * openat(2) to prevent security issues when a malicious client open=
s special
> > > + * files such as block device nodes. Symlink inodes are also rejecte=
d since
> > > + * symlinks must already have been traversed on the client side.
> > > + */
> > > +static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> > > +                         int open_flags)
> > > +{
> > > +    g_autofree char *fd_str =3D g_strdup_printf("%d", inode->fd);
> > > +    int fd;
> > > +
> > > +    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
> > > +        return -EBADF;
> > > +    }
> > > +
> > > +    fd =3D openat(lo->proc_self_fd, fd_str, open_flags);
> > > +    if (fd < 0) {
> > > +        return -errno;
> > > +    }
> > > +    return fd;
> > > +}
> > > +
> > >  static void lo_init(void *userdata, struct fuse_conn_info *conn)
> > >  {
> > >      struct lo_data *lo =3D (struct lo_data *)userdata;
> > > @@ -684,8 +708,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t=
 ino, struct stat *attr,
> > >          if (fi) {
> > >              truncfd =3D fd;
> > >          } else {
> > > -            sprintf(procname, "%i", ifd);
> > > -            truncfd =3D openat(lo->proc_self_fd, procname, O_RDWR);
> > > +            truncfd =3D lo_inode_open(lo, inode, O_RDWR);
> > >              if (truncfd < 0) {
> > >                  goto out_err;
> > >              }
> > > @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback, i=
nt allow_direct_io,
> > >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char =
*name,
> > >                        mode_t mode, struct fuse_file_info *fi)
> > >  {
> > > +    int open_flags =3D (fi->flags | O_CREAT) & ~O_NOFOLLOW;
> > >      int fd;
> > >      struct lo_data *lo =3D lo_data(req);
> > >      struct lo_inode *parent_inode;
> > > +    struct lo_inode *existing_inode =3D NULL;
> > >      struct fuse_entry_param e;
> > >      int err;
> > >      struct lo_cred old =3D {};
> > > @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_in=
o_t parent, const char *name,
> > > =20
> > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > =20
> > > -    fd =3D openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O=
_NOFOLLOW,
> > > -                mode);
> > > +    /* First, try to create a new file but don't open existing files=
 */
> > > +    fd =3D openat(parent_inode->fd, name, open_flags | O_EXCL, mode);
> > >      err =3D fd =3D=3D -1 ? errno : 0;
> > > +
> > >      lo_restore_cred(&old);
> > > =20
> > > +    /* Second, open existing files if O_EXCL was not specified */
> > > +    if (err =3D=3D EEXIST && !(fi->flags & O_EXCL)) {
> > > +        existing_inode =3D lookup_name(req, parent, name);
> >=20
> > No sure about the exact semantics of lookup_name()...
> >=20
> > > +        if (existing_inode) {
> >=20
> > IIUC we could stat() an ${name} path in the directory and
> > it matches an inode we already know about, right ?
> >=20
> > > +            fd =3D lo_inode_open(lo, existing_inode, open_flags);
> > > +            if (fd < 0) {
> > > +                err =3D -fd;
> > > +            }
> > > +        }
> >=20
> > What if lookup_name() returned false ? This means either there's
> > no ${name} path, which looks like the race we were discussing
> > with Miklos, or there's a ${name} but it doesn't match anything
> > we know... I guess the latter can happen if the ${name} was
> > created externally but we never had a chance to do a lookup
> > yet, right ? Shouldn't we do one at this point ?
> >=20
> > For now, it seems that both cases will return EEXIST, which
> > is likely confusing if O_EXCL was not specified.
>=20
> lo_rmdir(), lo_unlink(), and lo_rename() all behave this way too. That's
> another issue that needs to be addressed separately :).
>=20

I'm not questioning the fact that lookup_name() can fail, but rather
the error that is returned to the client. lo_rmdir() and friends
all return EIO when lookup_name() returns NULL. Maybe do the same
here ?

> I have an idea for unifying lo_open() and lo_create(). It will solve
> this issue by creating new inodes if necessary.
>=20

Great !

> Stefan


--Sig_/+0o=LGwsQ8Q=Ov3.OcpdNju
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAYVeEACgkQcdTV5YIv
c9ZTiQ/+O97nk8R/ilP5BUGlfojWDEyw6M/Gi4Ly5XJnZDhnZuuLV291/RjnGO+F
ls/wwhtmmpTe3/MpEyYc/82KxvNz0qzSRhoswIjSfAtkjLlRPbky937AmtnJICmP
ZUbRqAE3E75rO+DxmnhMl+qXhRWssz5DJqDvZRvdVf/hoCLaPliB+0HAnoU6vkxc
0vPKJ1QDMqZFHUn/7o3/FIeog/h5jTOUbqsnygkVeWEqbI1TyjgY19gSrFYjyrx8
Qng98XfTFQwJv5wMtPrAf8iXFgVTfg/yzfAtP9xTti1PDzF4e4x7Tw5BLm0sB3AZ
QwfvwdAT1+Sq2DcLFooTCu6RDXxDi/Lv6j1UJwLIsfAz0kw8KBcDiyRdccb4k0Nv
pfGh014yfZuIjPE+dYrUcwWl4TYcmnreh/kj5GY2JvNC+VtYp5qgmyNgu+tH1dNv
/w92jPz7azyV0xM1FvWej1LCBUhCyd6AkQoCzD3IsH9RQXRVCHaMSw5Ijygxo4K4
ukfgGBA3eBheNvxJTbygwLfkCD0JFVS21RzAOBol9M5AlV8DseVsZ3uh84JMmE6V
egD/SGo2VzJWWUTyy1njyddL4unspR6tRgCbCF3M99ZyGl3umO3pWxO/Ft/G0Amr
FyMmVE77TbL4HunLQlY3Ly08HdcdoJErww/aP2si967ib0O37uQ=
=SB/K
-----END PGP SIGNATURE-----

--Sig_/+0o=LGwsQ8Q=Ov3.OcpdNju--

