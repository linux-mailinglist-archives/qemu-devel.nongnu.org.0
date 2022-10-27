Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3DC60ED32
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 02:54:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onr5i-0003ye-51; Wed, 26 Oct 2022 20:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1onr5f-0003xc-Ah
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 20:49:47 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1onr5c-0001QP-8s
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 20:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666831784; x=1698367784;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FvvWtL4I3B5tW/nn3ePK70O46g5A4WVjT/KKoJcpLK4=;
 b=dk5JAPDQAV3sEeZKrhT2b4cHjfJMY3ipklRwS7XiTiyB+zhzURK2KoG4
 aROnwbnWb3xWu7UPgA4JI7HGhI0CWcZKu7IR89EYz/NyjT1qJjF/Eoixg
 b4+AHsl2sCoWGX7HiQ7xBZlJ7z75/oHtUsrxksbGZDK91vKL4GdXpD78l
 Obv+ES3n8kLghc3yyT2XS9XM3e6Rdm4s0QFcPuLCC4Yee0gdIIY2fIs5y
 MoudFechgfKjzprmAXQZ/ntX3NYiTARdvVlRt38kloqcs6rhWMTmd/FmU
 xluJnb6cSfFVuficIxCy+yttzI3uW3BnePqqBZLDW9XbDUwiZGFF83Vlt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309793107"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="309793107"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 17:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961433455"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="961433455"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2022 17:49:38 -0700
Message-ID: <c09a70a3b87d5d3169136e44ac0442b432ea3fba.camel@linux.intel.com>
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
From: Robert Hoo <robert.hu@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: imammedo@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 jingqi.liu@intel.com, qemu-devel@nongnu.org, robert.hu@intel.com
Date: Thu, 27 Oct 2022 08:49:37 +0800
In-Reply-To: <20221026104309-mutt-send-email-mst@kernel.org>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <20221026104309-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=robert.hu@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2022-10-26 at 10:45 -0400, Michael S. Tsirkin wrote:
> On Thu, Sep 22, 2022 at 08:21:55PM +0800, Robert Hoo wrote:
> > And empty bios-tables-test-allowed-diff.h.
> > 
> > Diff of ASL form, from qtest testlog.txt:
> > 
> > --- /tmp/asl-RFWZS1.dsl	2022-09-22 18:25:06.191519589 +0800
> > +++ /tmp/asl-B1ZZS1.dsl	2022-09-22 18:25:06.187519182 +0800
> 
> Adding --- is what broke things here and why this does not apply.
> You need to prefix each line e.g. with a space.
> 
OK, thanks Michael.
How about simply remove the 2 lines?
Do I need to resend a new version of this patch set?
> 
> > @@ -1,30 +1,30 @@
> >  /*
> >   * Intel ACPI Component Architecture
> >   * AML/ASL+ Disassembler version 20180629 (64-bit version)
> >   * Copyright (c) 2000 - 2018 Intel Corporation
> >   *
> >   * Disassembling to symbolic ASL+ operators
> >   *
> > - * Disassembly of tests/data/acpi/pc/SSDT.dimmpxm, Thu Sep 22
> > 18:25:06 2022
> > + * Disassembly of /tmp/aml-YYZZS1, Thu Sep 22 18:25:06 2022
> >   *
> >   * Original Table Header:
> >   *     Signature        "SSDT"
> > - *     Length           0x000002DE (734)
> > + *     Length           0x00000717 (1815)
> >   *     Revision         0x01
> > - *     Checksum         0x56
> > + *     Checksum         0xBC
> >   *     OEM ID           "BOCHS "
> >   *     OEM Table ID     "NVDIMM"
> >   *     OEM Revision     0x00000001 (1)
> >   *     Compiler ID      "BXPC"
> >   *     Compiler Version 0x00000001 (1)
> >   */
> >  DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
> >  {
> >      Scope (\_SB)
> >      {
> >          Device (NVDR)
> >          {
> >              Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  //
> > _HID: Hardware ID
> >              Method (NCAL, 5, Serialized)
> >              {
> >                  Local6 = MEMA /* \MEMA */
> > @@ -49,52 +49,52 @@
> >                      ODAT,   32736
> >                  }
> > 
> >                  If ((Arg4 == Zero))
> >                  {
> >                      Local0 = ToUUID ("2f10e7a4-9e91-11e4-89d3-
> > 123b93f75cba")
> >                  }
> >                  ElseIf ((Arg4 == 0x00010000))
> >                  {
> >                      Local0 = ToUUID ("648b9cf2-cda1-4312-8ad9-
> > 49c4af32bd62")
> >                  }
> >                  Else
> >                  {
> >                      Local0 = ToUUID ("4309ac30-0d11-11e4-9191-
> > 0800200c9a66")
> >                  }
> > 
> > -                If (((Local6 == Zero) | (Arg0 != Local0)))
> > +                If (((Local6 == Zero) || (Arg0 != Local0)))
> >                  {
> >                      If ((Arg2 == Zero))
> >                      {
> >                          Return (Buffer (One)
> >                          {
> >                               0x00                                 
> >             // .
> >                          })
> >                      }
> > 
> >                      Return (Buffer (One)
> >                      {
> >                           0x01                                     
> >         // .
> >                      })
> >                  }
> > 
> >                  HDLE = Arg4
> >                  REVS = Arg1
> >                  FUNC = Arg2
> > -                If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3)
> > == One)))
> > +                If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3)
> > == One)))
> >                  {
> >                      Local2 = Arg3 [Zero]
> >                      Local3 = DerefOf (Local2)
> >                      FARG = Local3
> >                  }
> > 
> >                  NTFI = Local6
> >                  Local1 = (RLEN - 0x04)
> >                  If ((Local1 < 0x08))
> >                  {
> >                      Local2 = Zero
> >                      Name (TBUF, Buffer (One)
> >                      {
> >                           0x00                                     
> >         // .
> >                      })
> >                      Local7 = Buffer (Zero){}
> > @@ -161,45 +161,234 @@
> >                      Else
> >                      {
> >                          If ((Local1 == Zero))
> >                          {
> >                              Return (Local2)
> >                          }
> > 
> >                          Local3 += Local1
> >                          Concatenate (Local2, Local0, Local2)
> >                      }
> >                  }
> >              }
> > 
> >              Device (NV00)
> >              {
> >                  Name (_ADR, One)  // _ADR: Address
> > +                Method (_LSI, 0, Serialized)  // _LSI: Label
> > Storage Information
> > +                {
> > +                    Local0 = NCAL (ToUUID ("4309ac30-0d11-11e4-
> > 9191-0800200c9a66"), One, 0x04, Zero, One)
> > +                    CreateDWordField (Local0, Zero, STTS)
> > +                    CreateDWordField (Local0, 0x04, SLSA)
> > +                    CreateDWordField (Local0, 0x08, MAXT)
> > +                    Local1 = Package (0x03)
> > +                        {
> > +                            STTS,
> > +                            SLSA,
> > +                            MAXT
> > +                        }
> > +                    Return (Local1)
> > +                }
> > +
> > +                Method (_LSR, 2, Serialized)  // _LSR: Label
> > Storage Read
> > +                {
> > +                    Name (INPT, Buffer (0x08)
> > +                    {
> > +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > 0x00   // ........
> > +                    })
> > +                    CreateDWordField (INPT, Zero, OFST)
> > +                    CreateDWordField (INPT, 0x04, LEN)
> > +                    OFST = Arg0
> > +                    LEN = Arg1
> > +                    Local0 = Package (0x01)
> > +                        {
> > +                            INPT
> > +                        }
> > +                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-
> > 9191-0800200c9a66"), One, 0x05, Local0, One)
> > +                    CreateDWordField (Local3, Zero, STTS)
> > +                    CreateField (Local3, 0x20, (LEN << 0x03),
> > LDAT)
> > +                    Name (LSA, Buffer (Zero){})
> > +                    ToBuffer (LDAT, LSA) /*
> > \_SB_.NVDR.NV00._LSR.LSA_ */
> > +                    Local1 = Package (0x02)
> > +                        {
> > +                            STTS,
> > +                            LSA
> > +                        }
> > +                    Return (Local1)
> > +                }
> > +
> > +                Method (_LSW, 3, Serialized)  // _LSW: Label
> > Storage Write
> > +                {
> > +                    Local2 = Arg2
> > +                    Name (INPT, Buffer (0x08)
> > +                    {
> > +                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > 0x00   // ........
> > +                    })
> > +                    CreateDWordField (INPT, Zero, OFST)
> > +                    CreateDWordField (INPT, 0x04, TLEN)
> > +                    OFST = Arg0
> > +                    TLEN = Arg1
> > +                    Concatenate (INPT, Local2, INPT) /*
> > \_SB_.NVDR.NV00._LSW.INPT */
> > +                    Local0 = Package (0x01)
> > +                        {
> > +                            INPT
> > +                        }
> > +                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-
> > 9191-0800200c9a66"), One, 0x06, Local0, One)
> > +                    CreateDWordField (Local3, Zero, STTS)
> > +                    Return (STTS) /* \_SB_.NVDR.NV00._LSW.STTS */
> > +                }
> > +
> > (iterates in each NV)
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > ---
> >  tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 1815
> > bytes
> >  tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 1815
> > bytes
> >  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
> >  3 files changed, 2 deletions(-)
> > 
> > diff --git a/tests/data/acpi/pc/SSDT.dimmpxm
> > b/tests/data/acpi/pc/SSDT.dimmpxm
> > index
> > ac55387d57e48adb99eb738a102308688a262fb8..70f133412f5e0aa128ab21024
> > 5a8de7304eeb843 100644
> > GIT binary patch
> > literal 1815
> > zcmdUwyKmD_6vnUPv~g}y6emHgc**|(X$OSF0FILox3Lr1ZmHx-examI3c8|YVC!RO
> > z2@)c;%774ZDvwC)2sTzGCN_pj>?}wOz&%bMqC!xRK#<|wbI(0K`Q7hx6kRVFqX~qV
> > z7sa|%)dh8?Br6KtBZP{x4GGpv_2!(V7cFzGeuJKCoK=-eBcjxh3x)9sl%G1ON@8t<
> > zC}l-#nk#BUt~04IjN>%dL<KcdC}Xaspw6mBMHbA}GjPCGOSQ6~m1lIJGObENMbxgY
> > zd`g(B+2~ZOl~ti$5{;G5iQtsKhzOs<nect)eDBFFfA>xHlK*k;x!u1QobwmcfE+b^
> > zczo}A|8-XCzLj4+n|SHk{n4mic$$>>kzKym<B*Vk)U<=Kp5H`U{=6L|{Wc1DmWcvG
> > z76FVb02yfmT5$S-f4_s{{ziu(n;nE)vhI4s17gyIJ1qk(jyu7HZ3lA%xtvj)uE0pb
> > z$53nM?6&KW^-Z{ri#Fj5p`{kAt=n$cB6l3jBFD@@19IxL9zw`xtdg$8LlAg=q1{28
> > zrW+#4D+#S48%eHS(G5iAVIj~13LO=IVY0&vbVM52T^rF6(*yzx3({MDR0%04*|42u
> > z2kyc74pk$D%$$vdh>qe^LJ0ZG7X5M#F6I*C?GzXSG@cDl2fPncQ;69=?`MKx80Oyc
> > z9B;|BU2{zuQ)dbV&Js%+lfN=#)pVIV;6G{<gX4%9U>kbZ#&Nx-i*)4_an>N&6Rd6+
> > zI@DnAgic;g(t#T0WVK=NDa_GVIQn#<fIx{T!*ObvwI|*}lvAOg$NmA!kj;2qj|yh!
> > zX3nG1z=PDg8a0li5EfPCA#5NgSsa5-$boD!LCLPANZb86oIwZg!$H0TWG)1949wv}
> > z%n%5UzDSI@Rs|ErBNK2eFCN1M9Qzd;CjYDrIQIKKO#MY44mk%#@ZbKTacs|tiGdUB
> > c@tk1)B`4Vb#EApW?>oVA@DG+o@4h6y0>WY85C8xG
> > 
> > delta 135
> > zcmbQvcaN1TIM^lR9uortW7tG4X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
> > zVKOVD5|2#v<i2b!mdWkej0~HN7+n~(Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
> > dMmNa;WevfyTuhS-Sw(n20!9!4=E=X=WB}s5Bn$um
> > 
> > diff --git a/tests/data/acpi/q35/SSDT.dimmpxm
> > b/tests/data/acpi/q35/SSDT.dimmpxm
> > index
> > 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..9ea4e0d0ceaa8a5cbd706afb6
> > d49de853fafe654 100644
> > GIT binary patch
> > literal 1815
> > zcmdUw%WD%+6vppl(q?j#N+yZ4_+tJ8(=J4Cp_55srp-*k%rq9JFfU2kq{_wCg}Xi$
> > ztr5g@s0$I9lvx(s3+~*ya^=3@R@?|K)O)5cETUCVG>dc3J@?GX?|$Ee=z7T*O(4YV
> > z6zft|7u04+RusBN2o+}<60Di(?O97NTIOo~7CqNEt16d9M5!Sc3gZ(fKXqD_#M%f^
> > z%8J-Bm(_+`XHsJr$7!yK3TmZL##~83omGvBESM|j;DD``YGpwyH+7*htx7^g)UGdo
> > zN|-Cz=v1qfRiR!IjpfgY;Ecb32%p25@LlF&|Jg2o|4sIa|8e$(J-8fP@E6j695sA+
> > z`rzi^byn)Vm0vxdc<I`M(WqY7NlN_4F5mBSNJu|v*}+)fZ=p?p&JL1(2ZcP#M1dg-
> > z07mA4jC24kIQz(d*u`;wy~~h|E<!F@b3Nh#F=@e_mVg$=o#4`zgE@j+&L~b-U?kyV
> > zsJ(rD%XP@w23*HQ8*qluVjI@>T{mo#dk$uiW9Fa%IdxhOA>=bwNmt?_2s}66=^{?k
> > z4H4y)gjSJ_Bv-HK1|oB?5a<Dgjtjsr*<l7cB8}{xjp&GJ0s)2v=}kYXgcOvl+s={$
> > z_uzbosu4qG&c;GSM{z14g#1;DemMsha|!ac3k(4o&xWT1-iN6v#2lOtGQltmbMJVL
> > zx9HlgxhjpR%|d~*#FED3uMJr>UFHt?j~m6{IAZp&4ZUaMxL(smx^jv*W034ARyPbC
> > zYOr@gCod=IKn-)U+A#PO=IARNeR@zpphT46IJL~$7jHhwsZh{k|A1x4X1tz91v7Lr
> > z=TT|kLF!$N8plxxi>mS%HjtAnjzK5nKsK46WH(Zz<Nh4Zpo0(KAYTMB7Xmo}=I{|_
> > z2n5GpB*t8=f(hf12{@J)Pv8QM{fZ5ff7S*Z`+Xm#{-O^@oO?#_-~OU;Y~P8AJtx?c
> > bIl=x*PO$%p6NjANcY@{MA1saDe@T1=QL*6=
> > 
> > delta 135
> > zcmbQvcaN1TIM^lR9uortquWF-X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
> > zVKOVD5|2#v<i2b!mdWkej0~HN7+n~(Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
> > dMmNa;WevfyTuhS-Sw(n20!9!4=E=X=WB}VOBm4jW
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
> > b/tests/qtest/bios-tables-test-allowed-diff.h
> > index eb8bae1407..dfb8523c8b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1,3 +1 @@
> >  /* List of comma-separated changed AML files to ignore */
> > -"tests/data/acpi/pc/SSDT.dimmpxm",
> > -"tests/data/acpi/q35/SSDT.dimmpxm",
> > -- 
> > 2.31.1
> 
> 


