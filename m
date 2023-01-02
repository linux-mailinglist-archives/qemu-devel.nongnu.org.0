Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6165B819
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 00:12:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCTx4-0002Ng-AS; Mon, 02 Jan 2023 18:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pCTx2-0002KQ-4U
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 18:10:40 -0500
Received: from sonic301-22.consmr.mail.gq1.yahoo.com ([98.137.64.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pCTwx-0002Pc-Gq
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 18:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1672701028; bh=/P05T3kVETVy1VB1C0TuUxelNF1OaAvo1evjneqVCMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=b+7pSiRSKew1q/VPQv7CaT+qZJBnZDTW0heVp++EhRpqK28AT8nCreJ1suIBVTu8czSCsrLd0J8HeGVXCkAm+qwrtyL6z7Wofh3s8WCEF5HmL+hNbei0cRKDfJ+1Mi2sHZAB8nTjJvZeMoLbU4UbMTWIzO7IaSeOaux+s8z68M/mWxb5r9iNLWuObrpDqtFqysnD2hWdkrr+gPQ09fmfQVUPpPbUSVJeOhiQDkqYozN1wXi3f3ue3diupb+CjWstFYm6/jUoxY1E4ONDpkNAWviJZXaraqlNZDDZyuDXMYEApuclr/ylcwj1j3L83zzLtpfckMp4VI5fzbcnUSfOlg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1672701028; bh=F7PED5wr9QAQjEahtUrLzVLgsgKiEXXeUwZjmBCgO8h=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=hCWIKrqN02NpKGle9G/IhBUWXwXGugj+Mihg4GftI73UNwJ830+EqA7FUaQ6zDplxk+SuyhFaORHG6dlzkw0VoEBsNCBecY6pS4T83d7jWWHlOInItZZsyK0J946nuJnlXZbCnbk89HnkhENvOxJMbOVL94xe+DUKk1I+g5E0mS+QwJRiAh4BHIl0lvxtIRfeUcFL4Z/pMqB2awTOjTo89BJSVUxbxBrrxpeQVBpTQCYCFWG/TSu3Lvzk74W7vhNJoeDSQ67fRgv2MoO3GTO2cWQp++13/3eSFexcL2I3pOO0TGCGz4FtSl22Yqu5ulegU85QqacmrdXz6gTL9+3Bw==
X-YMail-OSG: F0I5ySsVM1nusXZyF.Cjxyr_dddCC3_SHHp9I0IS_eTCEfOog1xA2ISVyCSMLbc
 5VRYLDj_3mzgO8dRLirYUu2nS01PUG_JplqrUMOMPNF7e3bvDoVgHO3H.d1KJ72CCMnzYJLDh0ys
 eMxO0NLUau7PzXigqidVCjhA1KMijX8fdUUxtXRCHK1.o6vTN02ZeY1MgwnGrN1yt6eiIburoQUR
 dn34Z9huL4PFLyQvWed_bmIcSq5Pic1ckBjNdPNXgcDy9eZ_Swx6ssyobjhMkh6T.06IG8aK_kb5
 B0uMGExA6v43Brfpx_vexlWAmS0H92rtrLaBZhkI8qB3f6aCe7q9ggSxXSNrlSDhYI7taWIkMsaw
 IpZD0VqdMmg0J_54fPzLLVawZj.cS.3H89cx0miEspQkucSyt8_l1adqlj6ZLRuDJnrcDXpb8D_W
 pHFgK3f.rOhMObixVVYhqz.fLnCyQt.mfoXvDCsmvOfyUXv9zyTS3QbbpqXdO4gTcmkUnMd0VCwZ
 dtTq2e6gq6nJ3TwsncW7LtgAf2GIIAUoGqqLFiOsM5378IgCtP30lJg_9cuOtgurm4CcgRdGlJ8S
 X9wfAqyjeETrhOscYIco8f0w.Z1y3vxZc7v3qWbsuqvJXE7IfuUeu6AzTBoE3ithGMohcy0IOESz
 8TF448t36ws5WMi6BtHbFGUHzjVtFnVrSVYYNRHWAZYkbx2h64K3tu.PqEyqRD0saZX7fI.i6v1K
 xNFupaLtOXvGoXDE.1ljGFrV26N04vo5P9sy1ClyNCVtofYD78xvM1K6OLfCXYiCLatWjRFi9_YX
 do3nyojH4gKoWPbG_RSAgyQB3L.a5rVN1gPBWDZoBd404mZvPJIROUrBUPEln7X0TuriY_bCpCBm
 lWgg2lX3Q0yBQFKUPczm.wYddPE_Jr5KC1jWOZW2mnQ8JoVEfP48ZdmUEHC9kVxux7yBbGbrpKiQ
 xVhOOOAEA4Kq32tlVfU.ZbFWWhiALU4C9Ebpjq.AdqI0et7K3YnzLG54EPGg.eRhXk.nqT4PaYaS
 eet.7h81VK2HIJAq7I8JOBTKFxJCgFPJTdAtPkRp7R3_1XKc3MT.9WFWKtvScgEBwO4z7bnABvgf
 oYN1XRc27xvVQbypSpD6ht_.l2BXSRj_8IpiHs1reejifFvafFLQi8qmp9k9JJN8aV8WvB6Q64ng
 Q7_3kGCuBwZQqgnonLMnkx3PYFVnO.EhUz6CnQoCb2SDE_U9or4BPEOwkuR7wGRcaWefQP16k4YV
 AwZQGTnEVgUNT5Q9BtBH5rcuxpH4wkD2XF._WSZjrO3cPsVviErG9OWr9knokD9yk5zlj55Hsfej
 mHvV39e2A7c.S2wDF2cRGl_nlQhYx2KIT_hefC5kptfo.qFFsaCz5LtUREyKx0bPxrKzzRe5pybk
 iu1F9mHYxro5sThCP78jA35LzURGA0PI05zAcx5FlqGtKYS6HK5iXda41O6n7uK8_UBzkheLBF7m
 Or3rqLS3J9MLggLVxUWbEINBLUXI6YGDiqebvmAD6HL3u_L9xFPLQFVh8Urk10hz.IL4_m9ib5eW
 xlePTrby0DpUD4Kc6IkcZ_G0aPZb45hwK491MT1XDv95CzfPEjQeLkXrlv_19MjP8d3nw5zBYeR5
 wp8KfV3NDryVIqkaSSW60d_hyPNrLaWxJxyydZBK2MqAV872EWJ5qhJuiJZtCecsU4_uaCpwHgds
 ErQcgFQ78Gna4sEac833bxjbxKFLbmM3Nw458rfNgJmaKrfbU9v0xBlGdsF5kyAG.pjgw15ZsWxZ
 5lf5vBQUj3EAhgkvbVKEm.x5xqMfmVBlfPGWTaUcSWyLA.5ndvuVpDNcmLJro7PYCJ.iYbgNT20i
 5jort5ktFigPIbreTXRvdFNqzsyvBhd0.Xs0EiRo9CEqJxg33aYemvy9_wK9ZfR8G26I9pbQTxLD
 Ewka.Oit1t.lagGwFkKNeLVsQMSA9dCNdJDUzZQ7XFYDiVWjUXVCvNlxypWq_asUVuyv5CfRkR3T
 gQy8.KphKCYdeuSdcH2hnYpVQ_ew3HKRSk5mvAYB0fK6hiP1HdCGlhqCZt4C4KPvraQnN0givVph
 lyg6XfmGZhXuuAmYSYJtbR7d_6lFMdcHKeelBqakhQupObVeCZwbFPdtGt1bX1aGKC5dWYv4JnjJ
 dw2Q41jP26DsiXH1ZqA0eUPcrNmXYRBZaDi_IbULyosecKqvefQZ2jHL.lQjD_xw3feieNMBolGX
 WpISfWsRX8OGlKYXC
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Mon, 2 Jan 2023 23:10:28 +0000
Received: by hermes--production-ne1-7b69748c4d-nmpxj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 963445cead58a3588ed1e45bff7a73fd; 
 Mon, 02 Jan 2023 23:10:26 +0000 (UTC)
Message-ID: <c21e933f-0539-9ffb-b2f8-f8e1a279b16f@netscape.net>
Date: Mon, 2 Jan 2023 18:10:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, alex.williamson@redhat.com
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <20230102124605-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.64.148; envelope-from=brchuckz@aim.com;
 helo=sonic301-22.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.142,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/2/23 12:46 PM, Michael S. Tsirkin wrote:
> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > as noted in docs/igd-assign.txt in the Qemu source code.
> > 
> > Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > Intel IGD passthrough to the guest with the Qemu upstream device model,
> > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > a different slot. This problem often prevents the guest from booting.
> > 
> > The only available workaround is not good: Configure Xen HVM guests to use
> > the old and no longer maintained Qemu traditional device model available
> > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > 
> > To implement this feature in the Qemu upstream device model for Xen HVM
> > guests, introduce the following new functions, types, and macros:
> > 
> > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > * typedef XenPTQdevRealize function pointer
> > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > 
> > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > the xl toolstack with the gfx_passthru option enabled, which sets the
> > igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > The new xen_igd_reserve_slot function also needs to be implemented in
> > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > in which case it does nothing.
> > 
> > The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > 
> > Move the call to xen_host_pci_device_get, and the associated error
> > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > initialize the device class and vendor values which enables the checks for
> > the Intel IGD to succeed. The verification that the host device is an
> > Intel IGD to be passed through is done by checking the domain, bus, slot,
> > and function values as well as by checking that gfx_passthru is enabled,
> > the device class is VGA, and the device vendor in Intel.
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> I'm not sure why is the issue xen specific. Can you explain?
> Doesn't it affect kvm too?

Recall from docs/igd-assign.txt that there are two modes for
igd passthrough: legacy and upt, and the igd needs to be
at slot 2 only when using legacy mode which gives one
single guest exclusive access to the Intel igd.

It's only xen specific insofar as xen does not have support
for the upt mode so xen must use legacy mode which
requires the igd to be at slot 2. I am not an expert with
kvm, but if I understand correctly, with kvm one can use
the upt mode with the Intel i915 kvmgt kernel module
and in that case the guest will see a virtual Intel gpu
that can be at any arbitrary slot when using kvmgt, and
also, in that case, more than one guest can access the
igd through the kvmgt kernel module.

Again, I am not an expert and do not have as much
experience with kvm, but if I understand correctly it is
possible to use the legacy mode with kvm and I think you
are correct that if one uses kvm in legacy mode and without
using the Intel i915 kvmgt kernel module, then it would be
necessary to reserve slot 2 for the igd on kvm.

Your question makes me curious, and I have not been able
to determine if anyone has tried igd passthrough using
legacy mode on kvm with recent versions of linux and qemu.
I will try reproducing the problem on kvm in legacy mode with
current versions of linux and qemu and report my findings.
With kvm, there might be enough flexibility to specify the
slot number for every pci device in the guest. Such a
capability is not available using the xenlight toolstack
for managing xen guests, so I have been using this patch
to ensure that the Intel igd is at slot 2 with xen guests
created by the xenlight toolstack.

The patch as is will only fix the problem on xen, so if the
problem exists on kvm also, I agree that the patch should
be modified to also fix it on kvm.

Chuck

