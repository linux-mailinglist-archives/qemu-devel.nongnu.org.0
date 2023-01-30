Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77563681686
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMX9C-0001wg-KL; Mon, 30 Jan 2023 11:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pMX8y-0001oJ-TW
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:36:36 -0500
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pMX8v-0003Wt-8q
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1675096584; bh=2HFANT5fPi8MHfmOiTz8mPPTzuxk0IT25/2NkLKNrMI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=aERGyoZ8ylovt8DStCQalHevc8McvksVhVS+YtkGxXsKsVTOCeh2QBSSFVs4/huEt0ao/7I0SoCHX/YUMwHagdnc8qUYK9wNF3AUr/2jha0kiif7jpizCNsFA10ST/kLuEHvnVV9x41vwMInBejbprRzXuCzXkgx7SeUiq+rRdPOySvg8FaQe8idiPhK9lQP7fZrll1fk/b6WWfie0IAwR5oPV2S0PydqHQqNjOvKoxtBMXLf+T3j/nlaN/jzkxcrBS8/BO+/iz5r8v4e/UENx//FBMvg6niamNVm1xg3mWavHa6Y/ADnDVgF4NpVJDS3hsZr0J+UhVmS5Oq35xQLQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1675096584; bh=AIa6Eu0KYY3CIAhbFy+e1Pkjp/ue6OQelf7LpoLO5C6=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=ei+9oyR1TzElq/2E6fUNXJ5vWEt5Kwb9KI7s2uZkPtVRA+W+HAfMN1JrcLc6an7QyNb/NgOKCKgOrOFWTX1u1WS0O6deq2gl0s8CgvlFbKMCb5dj+bejU0rv6ayIZpsq4Cbw1dn+tWBHw5v+V+MZiuyZkuIQKhet9rF+bGUx+KOipLy7yNwOiOzWUJhd+rbO1KIr6ai4LtqRpGzZaMwlAADmuYtdYNVH+70+nqD6lHSq3x5ye/4HsTvyt9oCHJXFxMilYkF6pJIchu+EiAHXz4SEUrtVts4HqrhlhiSWUTM9+7+r+6Rj7WnPdPg1xmUNaGQKZHSl3qXGpSwb9xYs6g==
X-YMail-OSG: EbHQjLEVM1m5rV3ZPZNETDpu.ErUTA80tMA5v7Xxs_HT11TcaCkKYGX1t9skpTq
 ytO_Z8DzLdsH6N3Jv9Yxzsmggh23JLNhonrE23EtRD9DAK3W_th3NWhCPM2C23YfDmrPQoQpC07v
 QeTlPKbqa1xIZuRiq8vnkZBMshJqXqQAd92nZIAptba5jUzA2MkNkfcv70aCa4ms7j0AVKMHZc22
 GirbHv.PjnyEcQiFXA1.jeegFfLbyRrZjKUYbsNJsr9.eZxph0.Lc4jhREjXrR04nAHj6TSzhddO
 73gEgnc0AgfSZ9n6gqd7Dt1n5JNAw7i1oWIEcgQWE8qJDqw3fq4QgZWz7Z7wjkBEFhvS0.nqjbIh
 HhxbPaa9a_shPLiWEFRr.Fh1zGAOH5o07M_5UtCkOmdl.tOTxp57Es4OWjK99Ph2uXa_i4G7q3JX
 ZK8H9ABtKYhjSdAOUiVdPkSoagRzs1dVrMLqTl2IjUYVG_8Hdgxkxdclk5d8HpFCiNztwHeKivar
 oD7jzJH9o2Avi69FC9F1rrh76Su.8ln5rEXB5JT75W9ZhwjGDq1TcRNZ_LmhP6qfgWuZLZngBvmx
 hdkaY.3cTLSn0o3gcAJ9RcqFStWYZ3WtknP3SUSA93Gzo3JolHP_BaUH4xk2m8UOt4t5jr8mkDZh
 16UKFjoXbHrKJJkOvkq9QDCRYdnqcxLSk5BEpiUWr1BMNHVh5eg6nPpp7VsqW3ho4uSDjR_77Qts
 itflVih_wSlYNCd.EzPE0qvx.h3KZYsGUmaLrO0KanC7rmaI0kGJletMZ13Gv_nsJaDq6Dy3DBYD
 .Im9dWjDaz6B5SU_O40.vnd1YwyGX80KYGyBL7o6Shp4wq4i.Nn5kfZ8MvdlWzzE9otIAn1zqaDM
 8875LJbT3cIfntivlc_FBV3ywZDJxxjMHNrX7R55I7HGDOoSJUFlkoFit7wQfxBveJ6wXG9yQb3T
 pMIT5wuKQIowfDvPapDs4XyTE6a78dEUgiNDGlWHGMdMN8Y4l0q5EUBWPfXyFfJjx_xECF.dKBe1
 E9CyfH35LRFj4uWA6k3_AvZ..7j0ZMj2OQT.r0k8XfOkK3z.SkdEBvtLvv4sJ9vRJssMr73O7til
 zW4AursSg2lay5N.GtriwnuO2.56BVGm.PZ.atqeFaWqh2DEZ2jj7XQ4WcEozWDXTDS2yTreTiL8
 zq_CGDfgqCcJzdK0SDnRqdwaS6SPUKF0OHvatHrCPlJMaISf5XndsXlt705SCMAP7dpE5on9V0me
 _.gC4hNCyHDWlcNkldqo_yP6Ma7G93FbdP.lG6s5cf0I_VTvcza00zj8cLogX8qFFL83xPpLJNHY
 WqjA8skB2S8hoz25yvaIYxdeA3Py0_KFtLUm8OaaNfT4RyNYsuC0s9cd2ZlhZuIQY_V9JIFe2nfX
 EgIan1.7Bti36WhGR9EDnkP2ZAiYjh7WA6wc9a0qnk4NatQxFvrHc_cgBeVsDC0SWkb8gI.XSxMg
 vdn3t4sDuYZ4mEriDygABiEDLCJWbcGWvsf7uaAeQlcbY.yHODHawv8amA.Ga.VLzl3BxlmURu3T
 fIATrudqvYAOv0KDIHnBJgokgPAuTsoRERd5xDF7Sc_fVWmJwwhwUW8u3dMoZMHsJYUH4gdhjP76
 g71aHxrQ2rzlr_fnUCERU_OaMH8LIJOhRcl6zuDuVft2Zkg_hpKrHEYx1UuVaA28S7CG87yFOQPc
 L0yC2CMTOy69yFDD5j7DGoW5nlc2qp8T90OkVDq_z_Ghssre91p2Mbt_5md9MlrAFAC_2Us40TPH
 QgxPP3eEgOEd7RKhc5PZx2cp57ww2oMY1DoUMsUW8juR32me994VyhkNVxgSX0t.hL6Q3NYzSSSV
 g6NDWcSDtkcSdh0eMsazmGslWz9NihCKGwNd9AeQKZkhAjulMHYCskFZ6mms6LW6JJzokwkGwJXx
 Uiiww_TEtdUs4dihqvBfZdwz2WFsdrtVscLpC41X1f9ibv0wYScN.ko_w0BErVXU1ssjxQM.zwzs
 pbSAXKIvaAPiYXS5ANK0J2AxTxFYFFhSGuBW9dfy_20KUqOrArdSblzIwp_wD4gHRE9FFLkdu2R1
 Ia.ISPtBTma7Dhunb526LqgDZvL_Ss.gtwFMKfPJrYtgbewGHepjRLIC1wpcjKauaWgXH0JdGZ.p
 if5_0BPi9VpYHINbH1EqEuf1oxqBkxp1guvOsXe.A.RMD1IyFFPTkMQJnZvjOoK_5Tby4GneBxG_
 Ax8schPCp
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Mon, 30 Jan 2023 16:36:24 +0000
Received: by hermes--production-ne1-746bc6c6c4-8sf8l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID dcb2dd38c6e433b619cd3a596ad6b731; 
 Mon, 30 Jan 2023 16:36:17 +0000 (UTC)
Message-ID: <be666c1d-f160-e870-8694-1ab4c6eef8a3@aol.com>
Date: Mon, 30 Jan 2023 11:36:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
 <20230128052506-mutt-send-email-mst@kernel.org>
 <56643500-7bdd-8204-0529-fa004ab10a44@aol.com>
 <20230128141348-mutt-send-email-mst@kernel.org>
Content-Language: en-US
In-Reply-To: <20230128141348-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.68.205; envelope-from=brchuckz@aim.com;
 helo=sonic304-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/28/23 2:14 PM, Michael S. Tsirkin wrote:
> On Sat, Jan 28, 2023 at 08:20:55AM -0500, Chuck Zmudzinski wrote:
> > On 1/28/23 5:26 AM, Michael S. Tsirkin wrote:
> > > On Fri, Jan 27, 2023 at 10:39:28PM -0500, Chuck Zmudzinski wrote:
> > >> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> > >> > On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> > >> > > The current reserved slot check in do_pci_register_device(), added with
> > >> > > commit 8b8849844fd6
> > >> >
> > >> > add ("subject here") please
> > >> >
> > >> > > ,is done even if the pci device being added is
> > >> > > configured manually for a particular slot. The new property, when set
> > >> > > to false, disables the check when the device is configured to request a
> > >> > > particular slot. This allows an administrator or management tool to
> > >> > > override slot_reserved_mask for a pci device by requesting a particular
> > >> > > slot for the device. The new property is initialized to true which
> > >> > > preserves the existing behavior of slot_reserved_mask by default.
> > >> > > 
> > >> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > >> >
> > >> > Thanks!
> > >> > I'm trying to think of the best default for this.
> > >> 
> > >> I think it would be better for the default value of
> > >> enforce_slot_reserved_mask_manual to be false, so that a
> > >> user-specified slot will by default override slot_reserved_mask.
> > >> But doing that would change the current behavior of
> > >> slot_reserved_mask.
> > >> 
> > >> Currently, this is the only place where slot_reserved_mask is used in all
> > >> of the Qemu source (code from hw/sparc64/sun4u.c):
> > >> 
> > >> ------ snip -------
> > >>     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
> > >>        reserved (leaving no slots free after on-board devices) however slots
> > >>        0-3 are free on busB */
> > >>     pci_bus->slot_reserved_mask = 0xfffffffc;
> > >>     pci_busA->slot_reserved_mask = 0xfffffff1;
> > >>     pci_busB->slot_reserved_mask = 0xfffffff0;
> > >> ------ snip -------
> > >> 
> > >> I think we could safely change the default value of
> > >> enforce_slot_reserved_mask_manual to false but set
> > >> it to true for the sparc64 sun4u board here to preserve
> > >> the current behavior of the only existing board in Qemu
> > >> that uses slot_reserved_mask.
> > >> 
> > >> What do you think?
> > > 
> > > I guess first can you answer whether this is still needed
> > > with the latest Xen patches?
> > > 
> > 
> > It's not really needed except for experimental purposes to allow
> > an administrator to test experimental configurations with a device
> > other than the igd at slot 2. That might be useful in some cases,
> > but it is not really necessary unless someone asks for that capability.
> > If libvirt users who ordinarily like to manually specify all the
> > settings will be OK with the proposed patch to xen that prevents
> > an administrator from being able to override a new setting that
> > reserves slot 2 for the igd for type "xenfv" machines configured for
> > igd passthrough, then there is no need for this patch. I don't think
> > many users need the capability to insert a different device in slot 2 for
> > the "xenfv" machine type configured with igd-passthru=on, so I would be
> > OK if this patch is not included in qemu.
> > 
> > Chuck
>
> Pls wait and see if that patch gets picked up. Let me know.
>

Hi Anthony,

I didn't Cc you when I proposed a patch to core pci to answer Michael's
complaint that the patch Qemu to reserve slot 2 for the Intel IGD
unconditionally reserves slot 2 for the IGD for the "xenfv" machine when
the guest is configured with igd-passthru=on.

I probably should have Cc'd this patch to you even though you are not
a maintainer of core pci because the discussion of this patch to core pci is
relevant to your decision about which patch to use (if any) to improve
support for the intel IGD with Xen and upstream Qemu.

Michael, who is a maintainer of core pci, shows interest in this patch
if you decide to pull up the patch to Qemu that reserves slot 2 for the Intel
IGD when using the "xenfv" machine configured with igd-passthru=on.

As you see from this message, we are waiting on a decision of the
Xen maintainers about what patch, if any, will be applied to fix
the support for the Intel IGD on Xen in Qemu upstream.

I know you have quite a bit of information from me to process before you
make a decision about which patch to apply to fix the Intel IGD support in
upstream Qemu and Xen, so please take enough time to make the best
decision. If you need any more information from me, please let me know
by replying to one of my proposed patches to fix support for the Intel IGD.

If you are subscribed to qemu-devel, you should have the full discussion of
this patch to Qemu core pci in your inbox. You can also access the proposed
patch and the discussion of the patch here:

https://lore.kernel.org/qemu-devel/ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com/

Kind regards,

Chuck

