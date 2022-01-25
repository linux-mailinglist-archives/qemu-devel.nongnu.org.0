Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E849B809
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:54:50 +0100 (CET)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCO9g-0005JA-VB
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCO3r-0007yo-Br
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCO3j-0004ky-QE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643125707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Te0UCjO0bXj2Ngkyh8PnLHW6G/RtLrviz62cOm4kMPE=;
 b=I8y3HYC2sokVg2vYebbMaD+e+E6rm0xjJ0J1OipSKYW7bcACuWMwW9CTSb5RWkPBztsXxl
 RRotG2fl+I1IaIrMr3VBvBMfR5ASsEwk81syfRGQnWJWsJOa7f70FS+BA0iLI090EakhXR
 RLjqjKQyjf/wXKSNnF2F1CwETmRz23Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-qKNoX7vPPlCCBgkgS6_y_Q-1; Tue, 25 Jan 2022 10:48:23 -0500
X-MC-Unique: qKNoX7vPPlCCBgkgS6_y_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6CB086A062;
 Tue, 25 Jan 2022 15:48:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9303B6E1FE;
 Tue, 25 Jan 2022 15:48:17 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:48:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 17/18] vfio-user: register handlers to facilitate
 migration
Message-ID: <YfAbwButynCFEBwY@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0fs5sJnvvqs4v/Sr"
Content-Disposition: inline
In-Reply-To: <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0fs5sJnvvqs4v/Sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 19, 2022 at 04:42:06PM -0500, Jagannathan Raman wrote:
> +     * The client subsequetly asks the remote server for any data that

subsequently

> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
> +    static int migrated_devs;
> +    Error *local_err = NULL;
> +    int ret;
> +
> +    /**
> +     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
> +     * VMSD data from source is not available at RESUME state.
> +     * Working on a fix for this.
> +     */
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
> +    }
> +
> +    ret = qemu_remote_loadvm(o->vfu_mig_file);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to restore device state");
> +        return;
> +    }
> +
> +    qemu_file_shutdown(o->vfu_mig_file);
> +    o->vfu_mig_file = NULL;
> +
> +    /* VFU_MIGR_STATE_RUNNING begins here */
> +    if (++migrated_devs == k->nr_devs) {

When is this counter reset so migration can be tried again if it
fails/cancels?

> +static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
> +                                 uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +
> +    if (offset > o->vfu_mig_buf_size) {
> +        return -1;
> +    }
> +
> +    if ((offset + size) > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - check pending_bytes");
> +        size = o->vfu_mig_buf_size - offset;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + offset), size);
> +
> +    o->vfu_mig_buf_pending -= size;

This assumes that the caller increments offset by size each time. If
that assumption is okay, then we can just trust offset and don't need to
do arithmetic on vfu_mig_buf_pending. If that assumption is not correct,
then the code needs to be extended to safely update vfu_mig_buf_pending
when offset jumps around arbitrarily between calls.

> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)
> +{
> +    DeviceClass *dc = DEVICE_GET_CLASS(DEVICE(pci_dev));
> +    const VMStateField *field = NULL;
> +    uint64_t size = 0;
> +
> +    if (!dc->vmsd) {
> +        return 0;
> +    }
> +
> +    field = dc->vmsd->fields;
> +    while (field && field->name) {
> +        size += vmstate_size(pci_dev, field);
> +        field++;
> +    }
> +
> +    return size;
> +}

This function looks incorrect because it ignores subsections as well as
runtime behavior during save(). Although VMStateDescription is partially
declarative, there is still a bunch of imperative code that can write to
the QEMUFile at save() time so there's no way of knowing the size ahead
of time.

I asked this in a previous revision of this series but I'm not sure if
it was answered: is it really necessary to know the size of the vmstate?
I thought the VFIO migration interface is designed to support
streaming reads/writes. We could choose a fixed size like 64KB and
stream the vmstate in 64KB chunks.

--0fs5sJnvvqs4v/Sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwG8AACgkQnKSrs4Gr
c8iPvggAmjapw5pZlrHg403UnelXEksolWVXM4U8fVvXKD/zXTX3cR+BhoGmeG2a
axpOE+HuZAB5xSLvCM/7yAnR9jDRLp7yJ/oo3Bjx8I5z3s6mh+t47yxlTZ4A3CjU
bVDN2Q+bHHxTikgXAY0cEJNwfAA4vv4UReNJRnrGj0MaBrGXOSKG7vScDccsYm1J
zvtbL0xyKK4uIf0PbKZggRsbJSSCLPgyWvsrq16yPmyPKKvHsDI3dNNScom2zE5I
yxL/EmAMPwZFO6km/d7MwGbBfsKeEWu6sH7+Wl5kMFbAui4d+6FGWN3cf2ofIUeJ
/M+xHEyhBwULmlyoWNy2jD3irJ+TTA==
=lSdW
-----END PGP SIGNATURE-----

--0fs5sJnvvqs4v/Sr--


