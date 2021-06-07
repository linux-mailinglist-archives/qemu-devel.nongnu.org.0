Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B339D93A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:02:27 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqC5S-0002Rn-Qo
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqBxV-00086G-N1; Mon, 07 Jun 2021 05:54:13 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqBxR-0001qi-4m; Mon, 07 Jun 2021 05:54:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 083F51791;
 Mon,  7 Jun 2021 05:54:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 07 Jun 2021 05:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fKQfELXVi6ak0EYRaMrxD/SVTe3
 WmyttwuyVJOKjgyk=; b=IeCNNpqMROXFdDw38NlR8Us3rAnhDTapFAknHcr6BVQ
 +x008bu0cxASnqP6WogZRuNKkHmScfrt82fLQpcK7ERQyvfpamOKmmbs2aaU9x/n
 203XqOd6g5/2nn9AyHLnYA8j6deBjlNzhug5pxXmRCpLb7f0/4w3bFpIhIMxc93O
 Rvj2bOVdF5OXfdiKbmwh4yr4gLX+QYagfbtvP5D47mZdNr/i0+A54MoALVGOyAZs
 e4OdTYT/RNT7px4QLRDrow/O6qM+/4hthLAJBwFlrZGDsjZpTqMYb7hyklv6Ewrh
 4ku4zz4RYFzIlmXGWNE1dboK8BkOIREsPnUQd+K244g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fKQfEL
 XVi6ak0EYRaMrxD/SVTe3WmyttwuyVJOKjgyk=; b=FOy+7+IBkIsJJGI62lOKHd
 WXxFYrquhw/u7rC377zzBIo2lhtaQa78OzHtbZydVJquFDxUemdIL1d6KYrbud2e
 f1oJl1/gKoVbS1DikBbOhuwTr9LD4EwdhFrr3VW4t7ug2NWvz9doFrZTw8ZMsiTD
 zIKBQZ7Z9nwjV7kyJ2SYy3hNP2QRvZvA+djzHMGfXJCTu6riG4Tj3gjMZcf7LFIA
 5lWSSH8vSNOdAJGIDVEvRQLqnu6xBpei/VTCaLth02X5iFf1evMWhchcEvv88PEj
 SVbRB7BXik7r/PQCfpw+6BG4bnaTW1cVPgpcjLeSw3wPArRtz9Z9RvTFIG+gNj0g
 ==
X-ME-Sender: <xms:vOy9YPQ9dtmnLSOCWGNhz9CAvPtt7tw7u_42-Rhvxdw2eQB18wPttA>
 <xme:vOy9YAy158_5kbgiOmGollcuQsRP63SGjOYKJpSN7Vh1t2L5NvJuiv1R_f2GkRdWC
 5P7ZRtDpCBmYLShM0o>
X-ME-Received: <xmr:vOy9YE02wfiMVu6khneTVAtq8-ad6LagP_GUKQvq49t0jQWjwp6NBIo5RFR0eIQ-E5g2ukE_Mj6M5L4ypfmez5UTf8ZUWAm8uvyVyAS2tUzn8r70HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vOy9YPC47JoxA37xz-SoHi5tBILL_W97BIPDB7t2F1TUu8l352YQPQ>
 <xmx:vOy9YIgidn7TGTMWXwSe2ZseUKnL8rts7f8qXPySayQe5bnnAZJgbw>
 <xmx:vOy9YDqAmUH9gFiUWAY3ZkAsXuAGO4o7xJZ3nXIMH1x6_GFyb8swVQ>
 <xmx:vey9YBvzdz8xLGnKepzg8aV7u3BZJcBgK8-a9NsGaq4muZHWqlNT9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 05:54:03 -0400 (EDT)
Date: Mon, 7 Jun 2021 11:54:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Message-ID: <YL3suv6IRJfoHl0u@apples.localdomain>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain> <YLUD4BggUinxUBGl@x1-carbon>
 <YLU7aJDjk8L8JMIi@apples.localdomain> <YLXiDGRgboJc6RUu@x1-carbon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="slIBRyIjk2Oo8i0M"
Content-Disposition: inline
In-Reply-To: <YLXiDGRgboJc6RUu@x1-carbon>
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


--slIBRyIjk2Oo8i0M
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun  1 07:30, Niklas Cassel wrote:
>On Mon, May 31, 2021 at 09:39:20PM +0200, Klaus Jensen wrote:
>> On May 31 15:42, Niklas Cassel wrote:
>> > On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
>> > > On May 28 11:05, Niklas Cassel wrote:
>> > > > From: Niklas Cassel <niklas.cassel@wdc.com>
>> > > >
>> > > > In the Zoned Namespace Command Set Specification, chapter
>> > > > 2.5.1 Managing resources
>> > > >
>> > > > "The controller may transition zones in the ZSIO:Implicitly Opened state
>> > > > to the ZSC:Closed state for resource management purposes."
>> > > >
>> > > > The word may in this sentence means that automatically transitioning
>> > > > an implicitly opened zone to closed is completely optional.
>> > > >
>> > > > Add a new parameter so that the user can control if this automatic
>> > > > transitioning should be performed or not.
>> > > >
>> > > > Being able to control this can help with verifying that e.g. a user-space
>> > > > program behaves properly even without this optional ZNS feature.
>> > > >
>> > > > The default value is set to true, in order to not change the existing
>> > > > behavior.
>> > > >
>> > > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> > > > ---
>> > > > hw/nvme/ctrl.c | 9 ++++++++-
>> > > > hw/nvme/ns.c   | 2 ++
>> > > > hw/nvme/nvme.h | 1 +
>> > > > 3 files changed, 11 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> > > > index 40a7efcea9..d00f0297a5 100644
>> > > > --- a/hw/nvme/ctrl.c
>> > > > +++ b/hw/nvme/ctrl.c
>> > > > @@ -141,6 +141,11 @@
>> > > >  *
>> > > >  *     zoned.cross_read=<enable RAZB, default: false>
>> > > >  *         Setting this property to true enables Read Across Zone Boundaries.
>> > > > + *
>> > > > + *     zoned.auto_transition=<enable auto resource management, default: true>
>> > > > + *         Indicates if zones in zone state implicitly opened can be
>> > > > + *         automatically transitioned to zone state closed for resource
>> > > > + *         management purposes.
>> > > >  */
>> > > >
>> > > > #include "qemu/osdep.h"
>> > > > @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
>> > > >         /* fallthrough */
>> > > >
>> > > >     case NVME_ZONE_STATE_CLOSED:
>> > > > -        nvme_zrm_auto_transition_zone(ns);
>> > > > +        if (ns->params.auto_transition_zones) {
>> > > > +            nvme_zrm_auto_transition_zone(ns);
>> > > > +        }
>> > > >         status = nvme_aor_check(ns, act, 1);
>> > > >         if (status) {
>> > > >             return status;
>> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>> > > > index 3fec9c6273..31dee43d30 100644
>> > > > --- a/hw/nvme/ns.c
>> > > > +++ b/hw/nvme/ns.c
>> > > > @@ -531,6 +531,8 @@ static Property nvme_ns_props[] = {
>> > > >                        params.max_open_zones, 0),
>> > > >     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
>> > > >                        params.zd_extension_size, 0),
>> > > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
>> > > > +                     params.auto_transition_zones, true),
>> > > >     DEFINE_PROP_END_OF_LIST(),
>> > > > };
>> > > >
>> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> > > > index 81a35cda14..bd86054db2 100644
>> > > > --- a/hw/nvme/nvme.h
>> > > > +++ b/hw/nvme/nvme.h
>> > > > @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
>> > > >     uint32_t max_active_zones;
>> > > >     uint32_t max_open_zones;
>> > > >     uint32_t zd_extension_size;
>> > > > +    bool     auto_transition_zones;
>> > > > } NvmeNamespaceParams;
>> > > >
>> > > > typedef struct NvmeNamespace {
>> > > > --
>> > > > 2.31.1
>> > > >
>> > >
>> > > Looks good Niklas!
>> > >
>> > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>> >
>> > In reality, it is the controller that does the auto transitioning.
>> >
>> > In theory, one namespace could be attached to two different controllers,
>> > and I guess, in that case, it depends on if the controller that we used
>> > when doing the write supports auto transitioning or not, that determines
>> > if a zone will be auto transitioned or not.
>> >
>> > If we were to change this to be a parameter of the controller instead
>> > of a parameter of the namespace, we would require to refactor a lot of
>> > code in the regular write path. As we currently don't have any NvmeRequest
>> > object in nvme_zrm_open_flags().
>> >
>> > Thoughts?
>> >
>>
>> I think you are right. This should be controller-specific behavior. I took
>> the liberty of moving the parameter; the refactor is minimal.
>>
>>
>> From: Niklas Cassel <niklas.cassel@wdc.com>
>>
>> In the Zoned Namespace Command Set Specification, chapter
>> 2.5.1 Managing resources
>>
>> "The controller may transition zones in the ZSIO:Implicitly Opened state
>> to the ZSC:Closed state for resource management purposes."
>>
>> The word may in this sentence means that automatically transitioning
>> an implicitly opened zone to closed is completely optional.
>>
>> Add a new parameter so that the user can control if this automatic
>> transitioning should be performed or not.
>>
>> Being able to control this can help with verifying that e.g. a user-space
>> program behaves properly even without this optional ZNS feature.
>>
>> The default value is set to true, in order to not change the existing
>> behavior.
>>
>> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> [k.jensen: moved parameter to controller]
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/nvme/nvme.h |  1 +
>>  hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
>>  2 files changed, 23 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 81a35cda142b..93a7e0e5380e 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -382,6 +382,7 @@ typedef struct NvmeParams {
>>      uint8_t  vsl;
>>      bool     use_intel_id;
>>      uint8_t  zasl;
>> +    bool     auto_transition_zones;
>>      bool     legacy_cmb;
>>  } NvmeParams;
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 40a7efcea914..8dd9cb2ccbf3 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -34,6 +34,7 @@
>>   *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
>>   *              mdts=<N[optional]>,vsl=<N[optional]>, \
>>   *              zoned.zasl=<N[optional]>, \
>> + *              zoned.auto_transition=<on|off[optional]>, \
>>   *              subsys=<subsys_id>
>>   *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
>>   *              zoned=<true|false[optional]>, \
>> @@ -100,6 +101,11 @@
>>   *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
>>   *   defaulting to the value of `mdts`).
>>   *
>> + * - `zoned.auto_transition`
>> + *   Indicates if zones in zone state implicitly opened can be automatically
>> + *   transitioned to zone state closed for resource management purposes.
>> + *   Defaults to 'on'.
>> + *
>>   * nvme namespace device parameters
>>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   * - `shared`
>> @@ -1686,8 +1692,8 @@ enum {
>>      NVME_ZRM_AUTO = 1 << 0,
>>  };
>> -static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
>> -                                    int flags)
>> +static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
>> +                                    NvmeZone *zone, int flags)
>>  {
>>      int act = 0;
>>      uint16_t status;
>> @@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
>>          /* fallthrough */
>>      case NVME_ZONE_STATE_CLOSED:
>> -        nvme_zrm_auto_transition_zone(ns);
>> +        if (n->params.auto_transition_zones) {
>> +            nvme_zrm_auto_transition_zone(ns);
>> +        }
>>          status = nvme_aor_check(ns, act, 1);
>>          if (status) {
>>              return status;
>> @@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
>>      }
>>  }
>> -static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
>> +static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
>> +                                     NvmeZone *zone)
>>  {
>> -    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
>> +    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
>>  }
>> -static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
>> +static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
>> +                                     NvmeZone *zone)
>>  {
>> -    return nvme_zrm_open_flags(ns, zone, 0);
>> +    return nvme_zrm_open_flags(n, ns, zone, 0);
>>  }
>>  static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
>> @@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
>>              goto invalid;
>>          }
>> -        status = nvme_zrm_auto(ns, zone);
>> +        status = nvme_zrm_auto(nvme_ctrl(req), ns, zone);
>>          if (status) {
>>              goto invalid;
>>          }
>> @@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
>>              goto invalid;
>>          }
>> -        status = nvme_zrm_auto(ns, zone);
>> +        status = nvme_zrm_auto(n, ns, zone);
>>          if (status) {
>>              goto invalid;
>>          }
>> @@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
>>  static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
>>                                 NvmeZoneState state, NvmeRequest *req)
>>  {
>> -    return nvme_zrm_open(ns, zone);
>> +    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
>>  }
>>  static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
>> @@ -6259,6 +6269,8 @@ static Property nvme_props[] = {
>>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
>>      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
>>      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>> +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>> +                     params.auto_transition_zones, true),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>> --
>> 2.31.1
>>
>
>Thanks a lot Klaus! I really appreciate it.
>
>My initial thought was to add a new flag in the enum where NVME_ZRM_AUTO is.
>But I think that would just make the code harder to read.
>You simply check the parameter directly, which is more obvious to the reader,
>so I think patch looks good!
>

Can I add your reviewed-by on this? :)

--slIBRyIjk2Oo8i0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC97LgACgkQTeGvMW1P
Dek4rQf+Ncod5otNQDkohx+H7O7WDl4xxILEacWs6Q6IULyyIyJpmmXqdyeVmqpm
su4+oGIipSC1fN2FUEwgcq5xVveD0dpSUx15AqA/PwRLMJ5KsnkcTfLimJLVb674
F59OuZ1Z7EJJ71BSyBLCRCclocdla3Bxa/3ZZgp//tbaEC8NaXOmLs5+1q+6cAuz
GhoEg3wcO7GH0T6LoeQfjcvrYDRlldlY5YrsgwIA/cU0W0iXDOOOlFqvqPZRdHHU
DLy+Z4IB8yD3w4deaZTO2/TChdOOfAo8qyfKpENXEjUG9MlhelT9pe1vXu7iFCJo
4cZoZgYqaBz9j7xuq1APerTInMPxVA==
=6YdB
-----END PGP SIGNATURE-----

--slIBRyIjk2Oo8i0M--

