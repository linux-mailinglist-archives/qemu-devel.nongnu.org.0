Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A56EBC7D
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 04:52:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqPp4-0001N8-Qu; Sat, 22 Apr 2023 22:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pqPp0-0001Mf-Bc
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 22:51:26 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pqPou-0004vN-7Y
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 22:51:25 -0400
X-UUID: ee21c78ace5a456090b538446d894e7b-20230423
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:59e3bd9f-0d62-4756-a015-6d39797880cf, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-15
X-CID-INFO: VERSION:1.1.22, REQID:59e3bd9f-0d62-4756-a015-6d39797880cf, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-15
X-CID-META: VersionHash:120426c, CLOUDID:c92fd2eb-db6f-41fe-8b83-13fe7ed1ef52,
 B
 ulkID:230421211438JX47GRIZ,BulkQuantity:2,Recheck:0,SF:24|17|19|44|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ee21c78ace5a456090b538446d894e7b-20230423
X-User: zenghao@kylinos.cn
Received: from [172.20.12.253] [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 452959015; Sun, 23 Apr 2023 10:51:02 +0800
Message-ID: <6a1c4e1444f64e9c6fbf6b3d52162ba1fb299aed.camel@kylinos.cn>
Subject: Re: [PATCH v5] cxl-cdat:Fix open file not closed in ct3_load_cdat
From: Hao Zeng <zenghao@kylinos.cn>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, fan.ni@samsung.com, philmd@linaro.org, Peter
 Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Apr 2023 10:50:56 +0800
In-Reply-To: <20230421141428.00006f44@huawei.com>
References: <20230413122358.3737557-1-zenghao@kylinos.cn>
 <20230421141428.00006f44@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hi Jonathan:

Thank you very much

Best regards
--- Hao


On Fri, 2023-04-21 at 14:14 +0100, Jonathan Cameron wrote:
> On Thu, 13 Apr 2023 20:23:58 +0800
> Hao Zeng <zenghao@kylinos.cn> wrote:
>=20
> > Open file descriptor not closed in error paths. Fix by replace
> > open coded handling of read of whole file into a buffer with
> > g_file_get_contents()
> >=20
> > Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange
> > implementation")
> > Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Suggested-by: Jonathan Cameron via <qemu-devel@nongnu.org>
> >=20
> > ---
> > ChangeLog:
> > =C2=A0=C2=A0=C2=A0 v4-v5:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixes some style issues and =
keep the protection after using
> > g_free()
> > =C2=A0=C2=A0=C2=A0 v3-v4:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Modify commit information,No=
 code change.
> > =C2=A0=C2=A0=C2=A0 v2->v3:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Submission of v3 on the basi=
s of v2, based on Philippe
> > Mathieu-Daud=C3=A9's suggestion
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Pointless bzero in g_malloc=
0, however this code would be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 simplified using g_fil=
e_get_contents()."
> > =C2=A0=C2=A0=C2=A0 v1->v2:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Patch 1: No change in patc=
h v1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Patch 2: Fix the check on =
the return value of fread() in
> > ct3_load_cdat
> > ---
> > =C2=A0hw/cxl/cxl-cdat.c | 27 ++++++++-------------------
> > =C2=A01 file changed, 8 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> > index 137abd0992..dd69366797 100644
> > --- a/hw/cxl/cxl-cdat.c
> > +++ b/hw/cxl/cxl-cdat.c
> > @@ -110,29 +110,18 @@ static void ct3_load_cdat(CDATObject *cdat,
> > Error **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0 g_autofree CDATEntry *cdat_st =3D NULL;
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t sum =3D 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0 int num_ent;
> > -=C2=A0=C2=A0=C2=A0 int i =3D 0, ent =3D 1, file_size =3D 0;
> > +=C2=A0=C2=A0=C2=A0 int i =3D 0, ent =3D 1;
> > +=C2=A0=C2=A0=C2=A0 gsize file_size =3D 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0 CDATSubHeader *hdr;
> > -=C2=A0=C2=A0=C2=A0 FILE *fp =3D NULL;
> > +=C2=A0=C2=A0=C2=A0 GError *error =3D NULL;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Read CDAT file and create its cache */
> > -=C2=A0=C2=A0=C2=A0 fp =3D fopen(cdat->filename, "r");
> > -=C2=A0=C2=A0=C2=A0 if (!fp) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Una=
ble to open file");
> > +=C2=A0=C2=A0=C2=A0 if (!g_file_get_contents(cdat->filename, (gchar **)=
&cdat->buf,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &file_size, &error)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Fil=
e read failed: %s", error-
> > >message);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_error_free(error);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > -
> > -=C2=A0=C2=A0=C2=A0 fseek(fp, 0, SEEK_END);
> > -=C2=A0=C2=A0=C2=A0 file_size =3D ftell(fp);
> > -=C2=A0=C2=A0=C2=A0 fseek(fp, 0, SEEK_SET);
> > -=C2=A0=C2=A0=C2=A0 cdat->buf =3D g_malloc0(file_size);
> > -
> > -=C2=A0=C2=A0=C2=A0 if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT: Fil=
e read failed");
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > -=C2=A0=C2=A0=C2=A0 }
> > -
> > -=C2=A0=C2=A0=C2=A0 fclose(fp);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (file_size < sizeof(CDATTableHeader)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "CDAT=
: File too short");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > @@ -219,6 +208,6 @@ void cxl_doe_cdat_release(CXLComponentState
> > *cxl_cstate)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdat->private);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (cdat->buf) {
>=20
> Check patch complains about this check being unnecessary. I'll drop
> the check
> and then pick up this patch as a precusor to the other stuff Peter
> pointed out in this
> area.
>=20
> Thanks,
>=20
> Jonathan
>=20
>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(cdat->buf);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free(cdat->buf);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
>=20


