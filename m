Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F84A5961
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:42:05 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpfp-0008BX-23
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nEpc2-0004UM-H8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nEpbz-0005y3-DK
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643708284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QT7ErQe3D4tg+xHs/qGUT7lAy3/dqFjXOwiPOCIXQs=;
 b=gVEWReO3hthOzc53bkY4NMJyRQg2SbuxLiaRarv8vSI6k7mhaigzyjYT9ys/HiQZsJ2FK8
 jihDWqWUsSgmacrO81Yammbkon4IZzcP/jlsVnaObntIReQwFYoqpLBqcBZAISoIQlcNgk
 5MmIzMm2lP01AeUZ7+x8l7SLHhYt4AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-8y3VBAvONamfUZbo1ewmbw-1; Tue, 01 Feb 2022 04:38:01 -0500
X-MC-Unique: 8y3VBAvONamfUZbo1ewmbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25D48144E3;
 Tue,  1 Feb 2022 09:37:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 034FB66E07;
 Tue,  1 Feb 2022 09:37:38 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:37:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Message-ID: <Yfj/YRbCjR1bZ1xi@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
 <YfAbwButynCFEBwY@stefanha-x1.localdomain>
 <A4D21E02-4F6A-49C6-A7D8-24C30BD2B645@oracle.com>
 <YfOpZmI4GM6oGhGH@stefanha-x1.localdomain>
 <D244CCE0-EAD3-40F1-9B52-8F3B119072D2@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LOEdj6Lapm9ZoToc"
Content-Disposition: inline
In-Reply-To: <D244CCE0-EAD3-40F1-9B52-8F3B119072D2@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LOEdj6Lapm9ZoToc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 03:49:40AM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 28, 2022, at 3:29 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Thu, Jan 27, 2022 at 05:04:26PM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Jan 25, 2022, at 10:48 AM, Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> >>>=20
> >>> On Wed, Jan 19, 2022 at 04:42:06PM -0500, Jagannathan Raman wrote:
> >>>> +     * The client subsequetly asks the remote server for any data t=
hat
> >>>=20
> >>> subsequently
> >>>=20
> >>>> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> >>>> +{
> >>>> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> >>>> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(OBJECT(o));
> >>>> +    static int migrated_devs;
> >>>> +    Error *local_err =3D NULL;
> >>>> +    int ret;
> >>>> +
> >>>> +    /**
> >>>> +     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
> >>>> +     * VMSD data from source is not available at RESUME state.
> >>>> +     * Working on a fix for this.
> >>>> +     */
> >>>> +    if (!o->vfu_mig_file) {
> >>>> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_load, f=
alse);
> >>>> +    }
> >>>> +
> >>>> +    ret =3D qemu_remote_loadvm(o->vfu_mig_file);
> >>>> +    if (ret) {
> >>>> +        VFU_OBJECT_ERROR(o, "vfu: failed to restore device state");
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    qemu_file_shutdown(o->vfu_mig_file);
> >>>> +    o->vfu_mig_file =3D NULL;
> >>>> +
> >>>> +    /* VFU_MIGR_STATE_RUNNING begins here */
> >>>> +    if (++migrated_devs =3D=3D k->nr_devs) {
> >>>=20
> >>> When is this counter reset so migration can be tried again if it
> >>> fails/cancels?
> >>=20
> >> Detecting cancellation is a pending item. We will address it in the
> >> next rev. Will check with you if  we get stuck during the process
> >> of implementing it.
> >>=20
> >>>=20
> >>>> +static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
> >>>> +                                 uint64_t size, uint64_t offset)
> >>>> +{
> >>>> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> >>>> +
> >>>> +    if (offset > o->vfu_mig_buf_size) {
> >>>> +        return -1;
> >>>> +    }
> >>>> +
> >>>> +    if ((offset + size) > o->vfu_mig_buf_size) {
> >>>> +        warn_report("vfu: buffer overflow - check pending_bytes");
> >>>> +        size =3D o->vfu_mig_buf_size - offset;
> >>>> +    }
> >>>> +
> >>>> +    memcpy(buf, (o->vfu_mig_buf + offset), size);
> >>>> +
> >>>> +    o->vfu_mig_buf_pending -=3D size;
> >>>=20
> >>> This assumes that the caller increments offset by size each time. If
> >>> that assumption is okay, then we can just trust offset and don't need=
 to
> >>> do arithmetic on vfu_mig_buf_pending. If that assumption is not corre=
ct,
> >>> then the code needs to be extended to safely update vfu_mig_buf_pendi=
ng
> >>> when offset jumps around arbitrarily between calls.
> >>=20
> >> Going by the definition of vfu_migration_callbacks_t in the library, I=
 assumed
> >> that read_data advances the offset by size bytes.
> >>=20
> >> Will add a comment a comment to explain that.
> >>=20
> >>>=20
> >>>> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)
> >>>> +{
> >>>> +    DeviceClass *dc =3D DEVICE_GET_CLASS(DEVICE(pci_dev));
> >>>> +    const VMStateField *field =3D NULL;
> >>>> +    uint64_t size =3D 0;
> >>>> +
> >>>> +    if (!dc->vmsd) {
> >>>> +        return 0;
> >>>> +    }
> >>>> +
> >>>> +    field =3D dc->vmsd->fields;
> >>>> +    while (field && field->name) {
> >>>> +        size +=3D vmstate_size(pci_dev, field);
> >>>> +        field++;
> >>>> +    }
> >>>> +
> >>>> +    return size;
> >>>> +}
> >>>=20
> >>> This function looks incorrect because it ignores subsections as well =
as
> >>> runtime behavior during save(). Although VMStateDescription is partia=
lly
> >>> declarative, there is still a bunch of imperative code that can write=
 to
> >>> the QEMUFile at save() time so there's no way of knowing the size ahe=
ad
> >>> of time.
> >>=20
> >> I see your point, it would be a problem for any field which has the
> >> (VMS_BUFFER | VMS_ALLOC) flags set.
> >>=20
> >>>=20
> >>> I asked this in a previous revision of this series but I'm not sure if
> >>> it was answered: is it really necessary to know the size of the vmsta=
te?
> >>> I thought the VFIO migration interface is designed to support
> >>> streaming reads/writes. We could choose a fixed size like 64KB and
> >>> stream the vmstate in 64KB chunks.
> >>=20
> >> The library exposes the migration data to the client as a device BAR w=
ith
> >> fixed size - the size of which is fixed at boot time, even when using
> >> vfu_migration_callbacks_t callbacks.
> >>=20
> >> I don=E2=80=99t believe the library supports streaming vmstate/migrati=
on-data - see
> >> the following comment in migration_region_access() defined in the libr=
ary:
> >>=20
> >> * Does this mean that partial reads are not allowed?
> >>=20
> >> Thanos or John,
> >>=20
> >>    Could you please clarify this?
> >>=20
> >> Stefan,
> >>    We attempted to answer the migration cancellation and vmstate size
> >>    questions previously also, in the following email:
> >>=20
> >> https://lore.kernel.org/all/F48606B1-15A4-4DD2-9D71-2FCAFC0E671F@oracl=
e.com/
> >=20
> >> libvfio-user has the vfu_migration_callbacks_t interface that allows t=
he
> >> device to save/load more data regardless of the size of the migration
> >> region. I don't see the issue here since the region doesn't need to be
> >> sized to fit the savevm data?
> >=20
> > The answer didn't make sense to me:
> >=20
> > "In both scenarios at the server end - whether using the migration BAR =
or
> > using callbacks, the migration data is transported to the other end usi=
ng
> > the BAR. As such we need to specify the BAR=E2=80=99s size during initi=
alization.
> >=20
> > In the case of the callbacks, the library translates the BAR access to =
callbacks."
> >=20
> > The BAR and the migration region within it need a size but my
> > understanding is that VFIO migration is designed to stream the device
> > state, allowing it to be broken up into multiple reads/writes with
> > knowing the device state's size upfront. Here is the description from
> > <linux/vfio.h>:
> >=20
> >  * The sequence to be followed while in pre-copy state and stop-and-cop=
y state
> >  * is as follows:
> >  * a. Read pending_bytes, indicating the start of a new iteration to ge=
t device
> >  *    data. Repeated read on pending_bytes at this stage should have no=
 side
> >  *    effects.
> >  *    If pending_bytes =3D=3D 0, the user application should not iterat=
e to get data
> >  *    for that device.
> >  *    If pending_bytes > 0, perform the following steps.
> >  * b. Read data_offset, indicating that the vendor driver should make d=
ata
> >  *    available through the data section. The vendor driver should retu=
rn this
> >  *    read operation only after data is available from (region + data_o=
ffset)
> >  *    to (region + data_offset + data_size).
> >  * c. Read data_size, which is the amount of data in bytes available th=
rough
> >  *    the migration region.
> >  *    Read on data_offset and data_size should return the offset and si=
ze of
> >  *    the current buffer if the user application reads data_offset and
> >  *    data_size more than once here.
> >  * d. Read data_size bytes of data from (region + data_offset) from the
> >  *    migration region.
> >  * e. Process the data.
> >  * f. Read pending_bytes, which indicates that the data from the previo=
us
> >  *    iteration has been read. If pending_bytes > 0, go to step b.
> >  *
> >  * The user application can transition from the _SAVING|_RUNNING
> >  * (pre-copy state) to the _SAVING (stop-and-copy) state regardless of =
the
> >  * number of pending bytes. The user application should iterate in _SAV=
ING
> >  * (stop-and-copy) until pending_bytes is 0.
> >=20
> > This means you can report pending_bytes > 0 until the entire vmstate has
> > been read and can pick a fixed chunk size like 64KB for the migration
> > region. There's no need to size the migration region to fit the entire
> > vmstate.
>=20
> Thank you for the pointer to generic VFIO migration, Stefan! Makes sense.
>=20
> So I understand that the VFIO migration region carves out a section to
> stream/shuttle device data between the app (QEMU client in this case) and=
 the
> driver (QEMU server). This section starts at data_offset within the regio=
n and spans
> data_size bytes.
>=20
> We could change the server to stream the data as outlined above. Do you h=
ave a
> preference for the section size? Does qemu_target_page_size() work? I jus=
t tested
> and am able to stream with a fixed BAR size such as qemu_target_page_size=
().

The VFIO migration API requires that data is written in the same chunk
sizes as it was read, so there is no way to merge or split chunks for
performance reasons once they have been read.

4KB may result in lots of chunks and that means more network traffic and
read()/write() calls. I think it's too small.

Something large like 1MB might create issues with responsiveness because
a 1MB chunk hogs the migration stream and read()/write() latency could
hog the event loop.

I'd go for 64KB. Dave and Juan might also have a suggestion for the size.

Stefan

--LOEdj6Lapm9ZoToc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmH4/2EACgkQnKSrs4Gr
c8gI1Af/T5zAv0OC/QMejp46/YZbwWDdq3ZUtRpQlwRmkopJSAvTa72q1CnNyD0P
hN3HYhEBhcSbvlUN6TVK7wGBAvNaz4d7xplgQRmHO5xFiuDXmiOXtA5SAmBV0OUw
HVVKUfV5JCxbLqJKJL21RG86ax2MVSDieusQitCEugF3L7x4f7q3Gd4PCm7/NPrb
KTZLEtW1KNvw62bX1pTREz6KVbouUhuKq27i9ZZXux1iGea301P4UpuZF2zcTW3F
52ZoRyEmZFSfbqqHN4pXuCgOXTatiCkXT65XH/Uwp3tDS9pQMXuUEr66N6vIhkXu
b+ZS/6u/PrIpv4hnVuoL7/1c6n0irQ==
=ZVg1
-----END PGP SIGNATURE-----

--LOEdj6Lapm9ZoToc--


