Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DE6F0C39
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 21:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6rk-000160-94; Thu, 27 Apr 2023 15:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6rg-00013z-2l
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 15:01:12 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6rd-0003jP-Ci
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 15:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682622065; i=lukasstraub2@web.de;
 bh=rM/+84AOPp7vcBqzucsNUdK55owS+3ZoEGLRiwvZ+rA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QujBK9LQXd3PEyai+TGbeTC7eKace25NtpDaadzEf917tGlBkKwbp46/IR+SGL15e
 UDERmGOidABfbe05OmJOditUD3gZxiaC5pxUvwR++b2Y7XJXFWyGnDax6P0udgAivo
 eQ8BxPlAsAw3HrPkqeg7Zd4O2K1i91dMA4tN+/TYBw5VmP2pBL3EiSlZV5WIofNPjR
 RtVYIOIM7V+opIrsaQO/ZA2gDvXUYdvmrr7WlP/J1vnAYaL2FTSz4LuqJMoy3UW6aq
 68GEvPQVGgBNLfDWBCNF8ar0eh8sYHujSJDhXJ+MiBKisuQiIdCroH6E12eah9FKUS
 v5BsLCUcpJJdg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjPPs-1qXGEU3xzG-00kmda; Thu, 27
 Apr 2023 21:01:05 +0200
Date: Thu, 27 Apr 2023 21:01:03 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 06/19] migration/rdma: Unfold last user of
 acct_update_position()
Message-ID: <20230427190103.27dc124b@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-7-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-7-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0VYU/K_2HGyINwb7oTdVYXl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:XkbOjrFc1kT4w5fgpQmBUhK0AOwDAxHLFAOuPWoxAOPEgxhQQvs
 W/ZAG1itDVvRY+9oPJAnee+OdKrzw6NqqTIP00heNK/YouwJMql5yT0SAFG/2jWu03WhCgq
 sRqIFmf/lqOxfzhOOcQSqgCr9FEMsqDwjocPtK0GEsxRmE0pwlTlOkJmlcRJtUhsV0SYN9L
 0qv6PvZsAnzCWwmDwlW9Q==
UI-OutboundReport: notjunk:1;M01:P0:Q+mE/SeXho4=;EcJ8Q1qxIK8MjdFvNC34igp0B3P
 Fs+KgY8fB+zmwzj4223nnuTxsQH/6/3BKNOo3TYmp6r3SV0GJZe/mbOne0DyYP1f5XRko2PPY
 hWQu0ZZ1KkP3n54yzCDDxKtCnfNxg+wvqA11lbcFGgXSMYkMepSTgt/NKMLpe/DleVGMalUX7
 qpXg1MMDLeWaO2iPQhn6+2oqGfpb4EIgp4dujLTIh/bva2m1VLZscPDlPWR2+toHhaFSi4BkP
 PjR1NG0P59SChbRxzUBdRCghAIbmHBP7pXqeAMIIW5fvg5KkRh0DsreIQJgpcfz3T36VE2m/J
 MQDBtn9jThgpJHNWSBe9s78OYEcAfnMJfD3lUaOZhhLAvNjUumh892FNHsQB8G4KodG+Y7fis
 dAjbNH+xIxhkDxlhyUiGilq52fwgjorGk+fTSVusnZuz547VtobBrZnOLHR5/95GFSMfm4Y5a
 np5K+KFpye8Ss8gkKrBAtoPug+J+gVUgvuQ3xvirLmsfSeT8mOH+78ThptUXyd0iJQv5QAfnt
 otTFaRHLrl2/GsmjxxF8FdDXRQUbofsLb29JzduADpd1jrRvkk6ljm7I9E+Jd3R3QTeUSd0lO
 THP1GbsNS06Obu/6Mxcq8jn8zdGBLZlGEIf6q+3oN8ib+2J/p24fovpdlWCxfG96+Rn+q/x5u
 NgQuTu11ub5K2+6/twU0e1jTeSK30PJ9rLvNQygmo12zflEwL93WL4FnK3+JiPKQmKefsNLbD
 Dt5DDhSR9Iiy95XwVLISMtXNicjxh9E/cWcwfp4nitwEmrCswgX10daw7dFEiMsK6JZf1sedv
 9ZMToc0cJ3rP+Ind3gukRsvroRFNgpdDRRF38q9cXOvTnmmJhvH7qrhXtb2kNdhCbzAP8ViKp
 ovLeom4XUW8aTAZ/q9KhuDrSA4AcGIJBIc8bTe5oDwQWb+PSojG1rJq6a95DZ9qfWg+gobnLI
 kGAEgJ8rCoHFnSu2V/4SaP05igA=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/0VYU/K_2HGyINwb7oTdVYXl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:36 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  migration/ram.c  | 9 ---------
>  migration/ram.h  | 1 -
>  migration/rdma.c | 4 +++-
>  3 files changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index c249a1f468..7d81c4a39e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2629,15 +2629,6 @@ static int ram_find_and_save_block(RAMState *rs)
>      return pages;
>  }
> =20
> -void acct_update_position(QEMUFile *f, size_t size)
> -{
> -    uint64_t pages =3D size / TARGET_PAGE_SIZE;
> -
> -    stat64_add(&mig_stats.normal_pages, pages);
> -    ram_transferred_add(size);
> -    qemu_file_credit_transfer(f, size);
> -}
> -
>  static uint64_t ram_bytes_total_with_ignored(void)
>  {
>      RAMBlock *block;
> diff --git a/migration/ram.h b/migration/ram.h
> index 3804753ca3..6fffbeb5f1 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -53,7 +53,6 @@ void mig_throttle_counter_reset(void);
> =20
>  uint64_t ram_pagesize_summary(void);
>  int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_=
t len);
> -void acct_update_position(QEMUFile *f, size_t size);
>  void ram_postcopy_migrated_memory_release(MigrationState *ms);
>  /* For outgoing discard bitmap */
>  void ram_postcopy_send_discard_bitmap(MigrationState *ms);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 7a9b284c3f..7e747b2595 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2231,7 +2231,9 @@ retry:
>      }
> =20
>      set_bit(chunk, block->transit_bitmap);
> -    acct_update_position(f, sge.length);
> +    stat64_add(&mig_stats.normal_pages, sge.length / qemu_target_page_si=
ze());
> +    ram_transferred_add(sge.length);
> +    qemu_file_credit_transfer(f, sge.length);
>      rdma->total_writes++;
> =20
>      return 0;



--=20


--Sig_/0VYU/K_2HGyINwb7oTdVYXl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKxm8ACgkQNasLKJxd
slgazw/+Ne8iFhOq+olAMFFFoHNmK/uSlHg5NSEblh1Kn4n3yCRcW0MYuXTqWeZ6
ukLQQ5hZbKIuRw0q1WJa/YxUBFZarkRcNAGCIR9W8ZiyD/emXp+odcbu+YPi7iax
iFEjFWss6tIEa5H+hE/TNDVE1h4fOEvvP6QR7ehepo+mvIUNa9niWnMcmCEdsbpH
KifOa8sdve71wZAchVtzE8mbXzHaNfAMObQSSS9q23sihXn2kCBeQX31Y0MlPqKG
MmgTZpikFz3eIOa8dXqjGOwHr18VUbdlo+/RnloDWedHO42tLg+9jYOmLCHPfnI9
ym41BAGGJmhotDlNMAZln0N1ZOyc18U8iYuOPsTLmztgzT89SQWrmgDqRxVZz5RG
6nZTWDX1ny3sKsOk1JC5APLNd2OCbo8akghfog6KW+Ba5FpMkCpDGNBJlT73R/v0
VLkgWaWjIZrhSc6zZxu7gyY0kP1d/dL4KdipHPvnkLJYpwlF6hyBi3smXfD+v6yF
pcbHF4UcVrc1hGJ3wpKogGpYCUKYpJCr+alTUN3pB0ACx/7STkbd0vluceP295xs
S0JZSjhzBsPyWWSaxHe5VJ8PnodLlCsD3gOSGrofLPmN9I8+giP/9/EzP6xjQj11
YHU5g+L070gBCs9hBgGZDZphc7jXSWutOfLHbuJZsoT0NwfG8+U=
=EJwM
-----END PGP SIGNATURE-----

--Sig_/0VYU/K_2HGyINwb7oTdVYXl--

