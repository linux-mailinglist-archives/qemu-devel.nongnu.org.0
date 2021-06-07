Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C137B39D976
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:19:43 +0200 (CEST)
Received: from localhost ([::1]:60136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCMA-0002Ec-55
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqCBj-00078z-4J; Mon, 07 Jun 2021 06:08:55 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqCBg-0002ir-Sd; Mon, 07 Jun 2021 06:08:54 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 69F021982;
 Mon,  7 Jun 2021 06:08:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Jun 2021 06:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=LWYnjfLh0FH+iFxXwWHQGETaZgf
 ikbrk5IthZJY4ma8=; b=FaT0lfMpInRRd2tvaz2AF96vu+GVHcFbkO+nTIbJvZ9
 2BT3j52Q69a7i+DfJdWr0z+12f5yUqXpLG2t86SDmAkwlNgVin+Z9wCtC45RdPNn
 0V1ZNNMkK/SOJfhgw38auzMGUOsh0ebyaHK0ouPVEuQNBATHwskT/2lSKAfFqdAg
 fdiJ13mYZp7bxwQLGSN8KIFnv/Ez+sN4fxjTP57BGvy9TpOqvv1xJh+qg9Kuwmrg
 cQP0lh8tC833BCiHc5DtOC/PECf/7KzPiD7R51gwutn6z+bpwWfq7HsRQzNTeuAq
 B/+/3FoEJ8kHCjWh8WcyYHHhYHD3G5vjXgWuJ5Ywd4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LWYnjf
 Lh0FH+iFxXwWHQGETaZgfikbrk5IthZJY4ma8=; b=Gu7plb5b0TPaZdWnQRzK63
 bCGsrMc/Jzbj/LMoNGMY7ZDr254YqdzghRw2e2ZZ5mEYPqGCN0mOpN0jsjHr3gLd
 ngW+KJrb/d/KlOgN/zZIi37nMhPFqdcjYIbXHaSsTSiPpKsHOr1uKviLojIPFGd3
 RPFlGcz/nBMeumJpcOoNc5xBtMnsYwYEHJC7uLeLPjlrt2KNVyS7b8YElCG05c5M
 WNS4QllbWzNfrrlJVGLctSipbUcaZEY8WRSguhX875mIAtjDhDHFT7NO+eYlw5QR
 NDUjCdzlwHUd/A1Ses+MxBgEb6essPbT322tJaWypF6xrmfaZ+EcvH6vwI3TBvZQ
 ==
X-ME-Sender: <xms:MPC9YAU8E01_0eMWqPUbnK1lOgFPlC9V1o9Ba2IjWlOEOEy-AJzNEQ>
 <xme:MPC9YEkorwv16L7UrrE3pV6Zh63duL3vQYpjxQDs0XUJrZ-MJtbHEE8lYvywbFII_
 UJRkSOp34LuK1tvpxI>
X-ME-Received: <xmr:MPC9YEYVcsCu-Mq4F2YPCo2Wy7jQyiI0l6P4DJZfO57qbH0iGbhI_WrQO3f77j8odw76fcY3V055UB8fcVFYb2ARh0fagwNKlkxw25MH_k5WP3XfjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MPC9YPVeGwWyF-M8VtcT4vdaPMPovwK4g0soQH4TEy_-enq12V0kYg>
 <xmx:MPC9YKlQFwD9e0wBnH04PFBcJT-6bPuyVpFnBBVNDzCE_2l6Eyj9LQ>
 <xmx:MPC9YEfKF2fDSanM8HsRjEpmxPwM_dAk34Lr53Pz_WNMecj1ad84sA>
 <xmx:MfC9YMiRnkuzqQqbcuw7lNn-jQUlGyUHU7C_yE9pjOpzv6DYBXCCpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 06:08:47 -0400 (EDT)
Date: Mon, 7 Jun 2021 12:08:46 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Message-ID: <YL3wLtAqAPQ/1KF/@apples.localdomain>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain> <YLUD4BggUinxUBGl@x1-carbon>
 <YLU7aJDjk8L8JMIi@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L0vJlgGG2uYBBFbS"
Content-Disposition: inline
In-Reply-To: <YLU7aJDjk8L8JMIi@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L0vJlgGG2uYBBFbS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 31 21:39, Klaus Jensen wrote:
>On May 31 15:42, Niklas Cassel wrote:
>>On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
>>>On May 28 11:05, Niklas Cassel wrote:
>>>> From: Niklas Cassel <niklas.cassel@wdc.com>
>>>>
>>>> In the Zoned Namespace Command Set Specification, chapter
>>>> 2.5.1 Managing resources
>>>>
>>>> "The controller may transition zones in the ZSIO:Implicitly Opened sta=
te
>>>> to the ZSC:Closed state for resource management purposes."
>>>>
>>>> The word may in this sentence means that automatically transitioning
>>>> an implicitly opened zone to closed is completely optional.
>>>>
>>>> Add a new parameter so that the user can control if this automatic
>>>> transitioning should be performed or not.
>>>>
>>>> Being able to control this can help with verifying that e.g. a user-sp=
ace
>>>> program behaves properly even without this optional ZNS feature.
>>>>
>>>> The default value is set to true, in order to not change the existing
>>>> behavior.
>>>>
>>>> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>>>> ---
>>>> hw/nvme/ctrl.c | 9 ++++++++-
>>>> hw/nvme/ns.c   | 2 ++
>>>> hw/nvme/nvme.h | 1 +
>>>> 3 files changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>> index 40a7efcea9..d00f0297a5 100644
>>>> --- a/hw/nvme/ctrl.c
>>>> +++ b/hw/nvme/ctrl.c
>>>> @@ -141,6 +141,11 @@
>>>>  *
>>>>  *     zoned.cross_read=3D<enable RAZB, default: false>
>>>>  *         Setting this property to true enables Read Across Zone Boun=
daries.
>>>> + *
>>>> + *     zoned.auto_transition=3D<enable auto resource management, defa=
ult: true>
>>>> + *         Indicates if zones in zone state implicitly opened can be
>>>> + *         automatically transitioned to zone state closed for resour=
ce
>>>> + *         management purposes.
>>>>  */
>>>>
>>>> #include "qemu/osdep.h"
>>>> @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespac=
e *ns, NvmeZone *zone,
>>>>         /* fallthrough */
>>>>
>>>>     case NVME_ZONE_STATE_CLOSED:
>>>> -        nvme_zrm_auto_transition_zone(ns);
>>>> +        if (ns->params.auto_transition_zones) {
>>>> +            nvme_zrm_auto_transition_zone(ns);
>>>> +        }
>>>>         status =3D nvme_aor_check(ns, act, 1);
>>>>         if (status) {
>>>>             return status;
>>>> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>>> index 3fec9c6273..31dee43d30 100644
>>>> --- a/hw/nvme/ns.c
>>>> +++ b/hw/nvme/ns.c
>>>> @@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
>>>>                        params.max_open_zones, 0),
>>>>     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
>>>>                        params.zd_extension_size, 0),
>>>> +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
>>>> +                     params.auto_transition_zones, true),
>>>>     DEFINE_PROP_END_OF_LIST(),
>>>> };
>>>>
>>>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>> index 81a35cda14..bd86054db2 100644
>>>> --- a/hw/nvme/nvme.h
>>>> +++ b/hw/nvme/nvme.h
>>>> @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
>>>>     uint32_t max_active_zones;
>>>>     uint32_t max_open_zones;
>>>>     uint32_t zd_extension_size;
>>>> +    bool     auto_transition_zones;
>>>> } NvmeNamespaceParams;
>>>>
>>>> typedef struct NvmeNamespace {
>>>> --
>>>> 2.31.1
>>>>
>>>
>>>Looks good Niklas!
>>>
>>>Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>>
>>In reality, it is the controller that does the auto transitioning.
>>
>>In theory, one namespace could be attached to two different controllers,
>>and I guess, in that case, it depends on if the controller that we used
>>when doing the write supports auto transitioning or not, that determines
>>if a zone will be auto transitioned or not.
>>
>>If we were to change this to be a parameter of the controller instead
>>of a parameter of the namespace, we would require to refactor a lot of
>>code in the regular write path. As we currently don't have any NvmeRequest
>>object in nvme_zrm_open_flags().
>>
>>Thoughts?
>>
>
>I think you are right. This should be controller-specific behavior. I=20
>took the liberty of moving the parameter; the refactor is minimal.
>
>
>From: Niklas Cassel <niklas.cassel@wdc.com>
>
>In the Zoned Namespace Command Set Specification, chapter
>2.5.1 Managing resources
>
>"The controller may transition zones in the ZSIO:Implicitly Opened state
>to the ZSC:Closed state for resource management purposes."
>
>The word may in this sentence means that automatically transitioning
>an implicitly opened zone to closed is completely optional.
>
>Add a new parameter so that the user can control if this automatic
>transitioning should be performed or not.
>
>Being able to control this can help with verifying that e.g. a user-space
>program behaves properly even without this optional ZNS feature.
>
>The default value is set to true, in order to not change the existing
>behavior.
>
>Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>[k.jensen: moved parameter to controller]
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/nvme/nvme.h |  1 +
> hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
> 2 files changed, 23 insertions(+), 10 deletions(-)
>
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index 81a35cda142b..93a7e0e5380e 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -382,6 +382,7 @@ typedef struct NvmeParams {
>     uint8_t  vsl;
>     bool     use_intel_id;
>     uint8_t  zasl;
>+    bool     auto_transition_zones;
>     bool     legacy_cmb;
> } NvmeParams;
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 40a7efcea914..8dd9cb2ccbf3 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -34,6 +34,7 @@
>  *              aerl=3D<N[optional]>,aer_max_queued=3D<N[optional]>, \
>  *              mdts=3D<N[optional]>,vsl=3D<N[optional]>, \
>  *              zoned.zasl=3D<N[optional]>, \
>+ *              zoned.auto_transition=3D<on|off[optional]>, \
>  *              subsys=3D<subsys_id>
>  *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<nsid>=
,\
>  *              zoned=3D<true|false[optional]>, \
>@@ -100,6 +101,11 @@
>  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i=
=2Ee.
>  *   defaulting to the value of `mdts`).
>  *
>+ * - `zoned.auto_transition`
>+ *   Indicates if zones in zone state implicitly opened can be automatica=
lly
>+ *   transitioned to zone state closed for resource management purposes.
>+ *   Defaults to 'on'.
>+ *
>  * nvme namespace device parameters
>  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  * - `shared`
>@@ -1686,8 +1692,8 @@ enum {
>     NVME_ZRM_AUTO =3D 1 << 0,
> };
>-static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
>-                                    int flags)
>+static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
>+                                    NvmeZone *zone, int flags)
> {
>     int act =3D 0;
>     uint16_t status;
>@@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *n=
s, NvmeZone *zone,
>         /* fallthrough */
>     case NVME_ZONE_STATE_CLOSED:
>-        nvme_zrm_auto_transition_zone(ns);
>+        if (n->params.auto_transition_zones) {
>+            nvme_zrm_auto_transition_zone(ns);
>+        }
>         status =3D nvme_aor_check(ns, act, 1);
>         if (status) {
>             return status;
>@@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace =
*ns, NvmeZone *zone,
>     }
> }
>-static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
>+static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
>+                                     NvmeZone *zone)
> {
>-    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
>+    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
> }
>-static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
>+static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
>+                                     NvmeZone *zone)
> {
>-    return nvme_zrm_open_flags(ns, zone, 0);
>+    return nvme_zrm_open_flags(n, ns, zone, 0);
> }
> static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
>@@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
>             goto invalid;
>         }
>-        status =3D nvme_zrm_auto(ns, zone);
>+        status =3D nvme_zrm_auto(nvme_ctrl(req), ns, zone);
>         if (status) {
>             goto invalid;
>         }
>@@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeReque=
st *req, bool append,
>             goto invalid;
>         }
>-        status =3D nvme_zrm_auto(ns, zone);
>+        status =3D nvme_zrm_auto(n, ns, zone);
>         if (status) {
>             goto invalid;
>         }
>@@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
> static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
>                                NvmeZoneState state, NvmeRequest *req)
> {
>-    return nvme_zrm_open(ns, zone);
>+    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
> }
> static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
>@@ -6259,6 +6269,8 @@ static Property nvme_props[] =3D {
>     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false=
),
>     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
>     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>+                     params.auto_transition_zones, true),
>     DEFINE_PROP_END_OF_LIST(),
> };
>--=20
>2.31.1
>

Modified patch applied to nvme-next!


--L0vJlgGG2uYBBFbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC98CwACgkQTeGvMW1P
DemdKggAviEJq5x8wU7IVgQuCKf6CoMisvWXryTq9Xsw2DB6nEOS5rGjp50QB5P3
riH+brrzlS1IGrWf0Z7B1ruV6wTmkJXwar4/2ANyDyJUswSorGCnn1kF0UHasPIw
MGdRElVBQvirtdmnPhnMeVxxEuep21l/hHEsGVzqm3i/bqimQXuEz7dbGA55Vk/F
mqNtXthzF5nrJV1l4yRJh1Y3oPr2aVevjWLGUZJu4YH8XgNoIUS+UUpUk93JqJ4h
Z2u0wZVak1jbGcC0EB35K7HeOdwBLgKHDgcIINVbGZEbHltseOmcWblg29p7+Xia
7nvzrNALrAuLQCPqLDxwZ8PQwk6Fqg==
=cVPR
-----END PGP SIGNATURE-----

--L0vJlgGG2uYBBFbS--

