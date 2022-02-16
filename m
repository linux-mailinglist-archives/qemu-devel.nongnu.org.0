Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A164B8690
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:22:49 +0100 (CET)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIOW-0006PO-7V
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKIMr-00055s-1r
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKIMp-0008RG-3P
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645010462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEFSLa2ZrP3X8uyW9guqHJV0rblqdnSH0XaPxClQs6g=;
 b=BRLMuQz52nvUVWHKwtT4dHWcOTaNZyjhbnANPInT18WxNsEMz+wmFkVdq/w9Y5FPChlQ/+
 o6GjJxTvuT2BsvViT3EhwnGLeftMiUfyKHZRLsZGEYD3j6huO2h1kay9XDPRPDWb78JKF1
 8Sl2LFtZ4l/Zw/iYsf6kdBHZHKPxrzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-nygTVGqRPwuDTaf_lrJvlg-1; Wed, 16 Feb 2022 06:20:59 -0500
X-MC-Unique: nygTVGqRPwuDTaf_lrJvlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E277C1808322;
 Wed, 16 Feb 2022 11:20:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29BA810841E6;
 Wed, 16 Feb 2022 11:20:29 +0000 (UTC)
Date: Wed, 16 Feb 2022 11:20:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 0/8] ioregionfd introduction
Message-ID: <Ygzd/E+QRUhVYaxE@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <YgpsrdhBKfhbXPnG@stefanha-x1.localdomain>
 <20220215181604.GA33858@nuker>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sBd+srk+yI1nbMtg"
Content-Disposition: inline
In-Reply-To: <20220215181604.GA33858@nuker>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sBd+srk+yI1nbMtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 10:16:04AM -0800, Elena wrote:
> On Mon, Feb 14, 2022 at 02:52:29PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Feb 07, 2022 at 11:22:14PM -0800, Elena Ufimtseva wrote:
> > > This patchset is an RFC version for the ioregionfd implementation
> > > in QEMU. The kernel patches are to be posted with some fixes as a v4.
> > >=20
> > > For this implementation version 3 of the posted kernel patches was us=
er:
> > > https://lore.kernel.org/kvm/cover.1613828726.git.eafanasova@gmail.com/
> > >=20
> > > The future version will include support for vfio/libvfio-user.
> > > Please refer to the design discussion here proposed by Stefan:
> > > https://lore.kernel.org/all/YXpb1f3KicZxj1oj@stefanha-x1.localdomain/=
T/
> > >=20
> > > The vfio-user version needed some bug-fixing and it was decided to se=
nd
> > > this for multiprocess first.
> > >=20
> > > The ioregionfd is configured currently trough the command line and ea=
ch
> > > ioregionfd represent an object. This allow for easy parsing and does
> > > not require device/remote object command line option modifications.
> > >=20
> > > The following command line can be used to specify ioregionfd:
> > > <snip>
> > >   '-object', 'x-remote-object,id=3Drobj1,devid=3Dlsi0,fd=3D'+str(remo=
te.fileno()),\
> > >   '-object', 'ioregionfd-object,id=3Dioreg2,devid=3Dlsi0,iofd=3D'+str=
(iord.fileno())+',bar=3D1',\
> > >   '-object', 'ioregionfd-object,id=3Dioreg3,devid=3Dlsi0,iofd=3D'+str=
(iord.fileno())+',bar=3D2',\
> >=20
>=20
> Hi Stefan
>=20
> Thank you for taking a look!
>=20
> > Explicit configuration of ioregionfd-object is okay for early
> > prototyping, but what is the plan for integrating this? I guess
> > x-remote-object would query the remote device to find out which
> > ioregionfds need to be registered and the user wouldn't need to specify
> > ioregionfds on the command-line?
>=20
> Yes, this can be done. For some reason I thought that user will be able
> to configure the number/size of the regions to be configured as
> ioregionfds.=20
>=20
> >=20
> > > </snip>
> > >=20
> > > Proxy side of ioregionfd in this version uses only one file descripto=
r:
> > > <snip>
> > >   '-device', 'x-pci-proxy-dev,id=3Dlsi0,fd=3D'+str(proxy.fileno())+',=
ioregfd=3D'+str(iowr.fileno()), \
> > > </snip>
> >=20
> > This raises the question of the ioregionfd file descriptor lifecycle. In
> > the end I think it shouldn't be specified on the command-line. Instead
> > the remote device should create it and pass it to QEMU over the
> > mpqemu/remote fd?
>=20
> Yes, this will be same as vfio-user does.
> >=20
> > >=20
> > > This is done for RFC version and my though was that next version will
> > > be for vfio-user, so I have not dedicated much effort to this command
> > > line options.
> > >=20
> > > The multiprocess messaging protocol was extended to support inquiries
> > > by the proxy if device has any ioregionfds.
> > > This RFC implements inquires by proxy about the type of BAR (ioregion=
fd
> > > or not) and the type of it (memory/io).
> > >=20
> > > Currently there are few limitations in this version of ioregionfd.
> > >  - one ioregionfd per bar, only full bar size is supported;
> > >  - one file descriptor per device for all of its ioregionfds;
> > >  - each remote device runs fd handler for all its BARs in one IOThrea=
d;
> > >  - proxy supports only one fd.
> > >=20
> > > Some of these limitations will be dropped in the future version.
> > > This RFC is to acquire the feedback/suggestions from the community
> > > on the general approach.
> > >=20
> > > The quick performance test was done for the remote lsi device with
> > > ioregionfd and without for both mem BARs (1 and 2) with help
> > > of the fio tool:
> > >=20
> > > Random R/W:
> > >=20
> > > 	             read IOPS	read BW     write IOPS   write BW
> > > no ioregionfd	 889	    3559KiB/s   890          3561KiB/s
> > > ioregionfd	     938	    3756KiB/s   939          3757KiB/s
> >=20
> > This is extremely slow, even for random I/O. How does this compare to
> > QEMU running the LSI device without multi-process mode?
>=20
> These tests had the iodepth=3D256. I have changed this to 1 and tested
> without multiprocess, with multiprocess and multiprocess with both mmio
> regions as ioregionfds:
>=20
> 	                 read IOPS  read BW(KiB/s)  write IOPS   write BW (KiB/s)
> no multiprocess             89	         358	       90	    360
> multiprocess                138	         556	       139	    557
> multiprocess ioregionfd	    174	         698	       173	    693
>=20
> The fio config for randomrw:
> [global]
> bs=3D4K
> iodepth=3D1
> direct=3D0

Please set direct=3D1 so the guest page cache does not affect the I/O
pattern.

The host --drive option also needs cache.direct=3Don to avoid host page
cache effects.

The reason for benchmarking with direct=3D1 is to ensure that every I/O
request submitted by fio is forwarded to the underlying disk. Otherwise
the benchmark may be comparing guest page cache or host page cache hits,
which do not involve the disk.

Page cache read-ahead and write-behind may involve large block sizes and
therefore change the I/O pattern specified on the fio command-line. This
interferes with the benchmark and is another reason to use direct=3D1.

> ioengine=3Dlibaio
> group_reporting
> time_based
> runtime=3D240
> numjobs=3D1
> name=3Draw-randreadwrite
> rw=3Drandrw
> size=3D8G
> [job1]
> filename=3D/fio/randomrw
>=20
> And QEMU command line for non-mutliprocess:
>=20
> /usr/local/bin/qemu-system-x86_64  -name "OL7.4" -machine q35,accel=3Dkvm=
 -smp sockets=3D1,cores=3D2,threads=3D2 -m 2048 -hda /home/homedir/ol7u9boo=
t.img -boot d -vnc :0 -chardev stdio,id=3Dseabios -device isa-debugcon,ioba=
se=3D0x402,chardev=3Dseabios -device lsi53c895a,id=3Dlsi1 -drive id=3Ddrive=
_image1,if=3Dnone,file=3D/home/homedir/10gb.qcow2 -device scsi-hd,id=3Ddriv=
e1,drive=3Ddrive_image1,bus=3Dlsi1.0,scsi-id=3D0
>=20
> QEMU command line for multiprocess:
>=20
> remote_cmd =3D [ PROC_QEMU,                                              =
        \
>                '-machine', 'x-remote',                                   =
      \
>                '-device', 'lsi53c895a,id=3Dlsi0',                        =
        \
>                '-drive', 'id=3Ddrive_image1,file=3D/home/homedir/10gb.qco=
w2',   \
>                '-device', 'scsi-hd,id=3Ddrive2,drive=3Ddrive_image1,bus=
=3Dlsi0.0,'   \
>                               'scsi-id=3D0',                             =
        \
>                '-nographic',                                             =
      \
>                '-monitor', 'unix:/home/homedir/rem-sock,server,nowait',  =
              \
>                '-object', 'x-remote-object,id=3Drobj1,devid=3Dlsi0,fd=3D'=
+str(remote.fileno()),\
>                '-object', 'ioregionfd-object,id=3Dioreg2,devid=3Dlsi0,iof=
d=3D'+str(iord.fileno())+',bar=3D1,',\
>                '-object', 'ioregionfd-object,id=3Dioreg3,devid=3Dlsi0,iof=
d=3D'+str(iord.fileno())+',bar=3D2',\
>                ]
> proxy_cmd =3D [ PROC_QEMU,                                           \
>               '-D', '/tmp/qemu-debug-log', \
>               '-name', 'OL7.4',                                          =
      \
>               '-machine', 'pc,accel=3Dkvm',                              =
        \
>               '-smp', 'sockets=3D1,cores=3D2,threads=3D2',               =
            \
>               '-m', '2048',                                              =
      \
>               '-object', 'memory-backend-memfd,id=3Dsysmem-file,size=3D2G=
',        \
>               '-numa', 'node,memdev=3Dsysmem-file',                      =
        \
>               '-hda','/home/homedir/ol7u9boot.img',                      \
>               '-boot', 'd',                                              =
      \
>               '-vnc', ':0',                                              =
      \
>               '-device', 'x-pci-proxy-dev,id=3Dlsi0,fd=3D'+str(proxy.file=
no())+',ioregfd=3D'+str(iowr.fileno()),               \
>               '-monitor', 'unix:/home/homedir/qemu-sock,server,nowait',  =
              \
>               '-netdev','tap,id=3Dmynet0,ifname=3Dtap0,script=3Dno,downsc=
ript=3Dno', '-device','e1000,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01',\
>             ]
>=20
> Where for the test without ioregionfds, they are commented out.
>=20
> I am doing more testing as I see some inconsistent results.

Thanks for the benchmark details!

Stefan

--sBd+srk+yI1nbMtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIM3fwACgkQnKSrs4Gr
c8gAUgf+PHofp9SVcDQHLVN+CrgfDMsmx7YnvcNCiXDlWRshTNogtFOK1eBHYhdN
49L5lH+ykIgdSef/z+SyEYitibHzDaC3dEntFMr8lbvrd5mpH6JbJAcBP8ag55vO
jqWtqhAmMZ+9ocdmt+Y07vIbYM0U2IJ+g4g22UQwwFm3FEf8aNjmgj2aWsEtpoJG
UqE/LQ6o4cV6ssovtdoXU1QET6p5wK1tez9PDbR/qdQ1l2i560S4EEkUaJJ6uUyS
/bscYQhJLMk/XjId4Numl6i6GksmnSqF+ahb5WuovK723rXPhx8gn7EcM6Jayyog
4fnSqbceXiGXTbBuqKP/9PnscZXyIg==
=+CaM
-----END PGP SIGNATURE-----

--sBd+srk+yI1nbMtg--


