Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0796C44BCBD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:20:41 +0100 (CET)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkiqT-0002on-TP
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkioa-0001LV-IF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:18:41 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkioV-0008LZ-UG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:18:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 842EB2079A;
 Wed, 10 Nov 2021 08:18:32 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 10 Nov
 2021 09:18:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003af39becd-b509-4bdd-99a0-50229beef47a,
 FF02C7A8D8E58AFC286F2B1DBFB5F34314452EF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9db2efb6-5161-6c17-f7aa-4d8b7e1aba98@kaod.org>
Date: Wed, 10 Nov 2021 09:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Fwd: New Defects reported by Coverity Scan for QEMU
References: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
Content-Language: en-US
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, QEMU Developers
 <qemu-devel@nongnu.org>, QEMU PowerPC <qemu-ppc@nongnu.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
X-Forwarded-Message-Id: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3b0e276c-aac9-44ef-8f7b-8d83ed648c25
X-Ovh-Tracer-Id: 9248141836485495773
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeigddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfufhfvhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedufffgfedvfeeutdduhfeiteevgefgteeiheffgfdtieejgeeggfdvhffgkedvgeenucffohhmrghinhepshgvnhgughhrihgurdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SENDGRID_REDIR=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Luis,

Coverity found a couple of issues which seem related to the DFP patchset.
Could you please take a look ?

Thanks,

C.


-------- Forwarded Message --------
Subject: New Defects reported by Coverity Scan for QEMU
Date: Tue, 9 Nov 2021 22:09:40 +0000
From: scan-admin@coverity.com
To: clg@kaod.org

Hi,

Please find the latest report on new defect(s) introduced to QEMU found with Coverity Scan.

16 new defect(s) introduced to QEMU found with Coverity Scan.
19 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.

New defect(s) Reported-by: Coverity Scan
Showing 16 of 16 defect(s)


** CID 1465791:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465791:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 1202 in helper_DENBCD()
1196         }                                                                        \
1197         dfp_finalize_decimal##size(&dfp);                                        \
1198         dfp_set_FPRF_from_FRT(&dfp);                                             \
1199         set_dfp##size(t, &dfp.vt);                                               \
1200     }
1201
>>>     CID 1465791:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
1202     DFP_HELPER_ENBCD(DENBCD, 64)
1203     DFP_HELPER_ENBCD(DENBCDQ, 128)
1204
1205     #define DFP_HELPER_XEX(op, size)                               \
1206     void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
1207     {                                                              \

** CID 1465790:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465790:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 461 in helper_DSUB()
455         dfp_check_for_UX(dfp);
456         dfp_check_for_XX(dfp);
457         dfp_check_for_VXSNAN(dfp);
458         dfp_check_for_VXISI_subtract(dfp);
459     }
460
>>>     CID 1465790:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
461     DFP_HELPER_TAB(DSUB, decNumberSubtract, SUB_PPs, 64)
462     DFP_HELPER_TAB(DSUBQ, decNumberSubtract, SUB_PPs, 128)
463
464     static void MUL_PPs(struct PPC_DFP *dfp)
465     {
466         dfp_set_FPRF_from_FRT(dfp);

** CID 1465789:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465789:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 876 in helper_DRINTX()
870     {
871         dfp_set_FPRF_from_FRT(dfp);
872         dfp_check_for_XX(dfp);
873         dfp_check_for_VXSNAN(dfp);
874     }
875
>>>     CID 1465789:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
876     DFP_HELPER_RINT(DRINTX, RINTX_PPs, 64)
877     DFP_HELPER_RINT(DRINTXQ, RINTX_PPs, 128)
878
879     static void RINTN_PPs(struct PPC_DFP *dfp)
880     {
881         dfp_set_FPRF_from_FRT(dfp);

** CID 1465788:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465788:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 1390 in helper_DSCLI()
1384             }                                                           \
1385         }                                                               \
1386                                                                         \
1387         set_dfp##size(t, &dfp.vt);                                      \
1388     }
1389
>>>     CID 1465788:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
1390     DFP_HELPER_SHIFT(DSCLI, 64, 1)
1391     DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
1392     DFP_HELPER_SHIFT(DSCRI, 64, 0)

** CID 1465787:    (BAD_SHIFT)
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()


________________________________________________________________________________________________________
*** CID 1465787:    (BAD_SHIFT)
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
363             /*
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "src >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is as much as 64.
369             src >>= n;
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
369             src >>= n;
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "mask >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is as much as 64.
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }
375
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
350
351             /*
352              * Extracts 'n' trailing bits of src and put them on the leading 'n'
353              * bits of 'right' or 'left', pushing down the previously extracted
354              * values.
355              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "1LL << n", left shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
356             m = (1ll << n) - 1;
357             if (bit) {
358                 right = ror64(right | (src & m), n);
359             } else {
360                 left = ror64(left | (src & m), n);
361             }
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
350
351             /*
352              * Extracts 'n' trailing bits of src and put them on the leading 'n'
353              * bits of 'right' or 'left', pushing down the previously extracted
354              * values.
355              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "1LL << n", left shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is as much as 64.
356             m = (1ll << n) - 1;
357             if (bit) {
358                 right = ror64(right | (src & m), n);
359             } else {
360                 left = ror64(left | (src & m), n);
361             }
/qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
350
351             /*
352              * Extracts 'n' trailing bits of src and put them on the leading 'n'
353              * bits of 'right' or 'left', pushing down the previously extracted
354              * values.
355              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "1LL << n", left shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
356             m = (1ll << n) - 1;
357             if (bit) {
358                 right = ror64(right | (src & m), n);
359             } else {
360                 left = ror64(left | (src & m), n);
361             }
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
363             /*
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "src >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
369             src >>= n;
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
369             src >>= n;
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "mask >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }
375
/qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
369             src >>= n;
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "mask >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }
375
/qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
363             /*
364              * Discards the processed bits from 'src' and 'mask'. Note that we are
365              * removing 'n' trailing zeros from 'mask', but the logical shift will
366              * add 'n' leading zeros back, so the population count of 'mask' is kept
367              * the same.
368              */
>>>     CID 1465787:    (BAD_SHIFT)
>>>     In expression "src >>= n", right shifting by more than 63 bits has undefined behavior.  The shift amount, "n", is 64.
369             src >>= n;
370             mask >>= n;
371             i -= n;
372             bit = !bit;
373             mask = ~mask;
374         }

** CID 1465786:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465786:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 850 in helper_DRRND()
844         dfp_finalize_decimal##size(&dfp);                                   \
845         QUA_PPs(&dfp);                                                      \
846                                                                             \
847         set_dfp##size(t, &dfp.vt);                                          \
848     }
849
>>>     CID 1465786:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
850     DFP_HELPER_RRND(DRRND, 64)
851     DFP_HELPER_RRND(DRRNDQ, 128)
852
853     #define DFP_HELPER_RINT(op, postprocs, size)                                   \
854     void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,               \
855                  uint32_t r, uint32_t rmc)                                         \

** CID 1465785:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465785:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 489 in helper_DDIV()
483         dfp_check_for_XX(dfp);
484         dfp_check_for_VXSNAN(dfp);
485         dfp_check_for_VXZDZ(dfp);
486         dfp_check_for_VXIDI(dfp);
487     }
488
>>>     CID 1465785:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
489     DFP_HELPER_TAB(DDIV, decNumberDivide, DIV_PPs, 64)
490     DFP_HELPER_TAB(DDIVQ, decNumberDivide, DIV_PPs, 128)
491
492     #define DFP_HELPER_BF_AB(op, dnop, postprocs, size)                            \
493     uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)           \
494     {                                                                              \

** CID 1465784:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465784:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 754 in helper_DQUAI()
748         dfp_finalize_decimal##size(&dfp);                                   \
749         QUA_PPs(&dfp);                                                      \
750                                                                             \
751         set_dfp##size(t, &dfp.vt);                                          \
752     }
753
>>>     CID 1465784:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
754     DFP_HELPER_QUAI(DQUAI, 64)
755     DFP_HELPER_QUAI(DQUAIQ, 128)
756
757     #define DFP_HELPER_QUA(op, size)                                        \
758     void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,        \
759                      ppc_fprp_t *b, uint32_t rmc)                           \

** CID 1465783:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465783:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 885 in helper_DRINTN()
879     static void RINTN_PPs(struct PPC_DFP *dfp)
880     {
881         dfp_set_FPRF_from_FRT(dfp);
882         dfp_check_for_VXSNAN(dfp);
883     }
884
>>>     CID 1465783:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
885     DFP_HELPER_RINT(DRINTN, RINTN_PPs, 64)
886     DFP_HELPER_RINT(DRINTNQ, RINTN_PPs, 128)
887
888     void helper_DCTDP(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
889     {
890         struct PPC_DFP dfp;

** CID 1465782:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465782:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 448 in helper_DADD()
442         dfp_check_for_UX(dfp);
443         dfp_check_for_XX(dfp);
444         dfp_check_for_VXSNAN(dfp);
445         dfp_check_for_VXISI_add(dfp);
446     }
447
>>>     CID 1465782:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
448     DFP_HELPER_TAB(DADD, decNumberAdd, ADD_PPs, 64)
449     DFP_HELPER_TAB(DADDQ, decNumberAdd, ADD_PPs, 128)
450
451     static void SUB_PPs(struct PPC_DFP *dfp)
452     {
453         dfp_set_FPRF_from_FRT(dfp);

** CID 1465781:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465781:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 1302 in helper_DIEX()
1296             dfp.t.exponent = exp - bias;                                      \
1297             dfp_finalize_decimal##size(&dfp);                                 \
1298         }                                                                     \
1299         set_dfp##size(t, &dfp.vt);                                            \
1300     }
1301
>>>     CID 1465781:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
1302     DFP_HELPER_IEX(DIEX, 64)
1303     DFP_HELPER_IEX(DIEXQ, 128)
1304
1305     static void dfp_clear_lmd_from_g5msb(uint64_t *t)
1306     {
1307

** CID 1465780:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465780:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 900 in helper_DCTDP()
894         get_dfp64(&vb, b);
895         b_short = (uint32_t)vb.VsrD(1);
896
897         dfp_prepare_decimal64(&dfp, 0, 0, env);
898         decimal32ToNumber((decimal32 *)&b_short, &dfp.t);
899         dfp_finalize_decimal64(&dfp);
>>>     CID 1465780:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
900         set_dfp64(t, &dfp.vt);
901         dfp_set_FPRF_from_FRT(&dfp);
902     }
903
904     void helper_DCTQPQ(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)
905     {

** CID 1465779:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465779:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 1392 in helper_DSCRI()
1386                                                                         \
1387         set_dfp##size(t, &dfp.vt);                                      \
1388     }
1389
1390     DFP_HELPER_SHIFT(DSCLI, 64, 1)
1391     DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
>>>     CID 1465779:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
1392     DFP_HELPER_SHIFT(DSCRI, 64, 0)

** CID 1465778:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465778:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 772 in helper_DQUA()
766         dfp_finalize_decimal##size(&dfp);                                   \
767         QUA_PPs(&dfp);                                                      \
768                                                                             \
769         set_dfp##size(t, &dfp.vt);                                          \
770     }
771
>>>     CID 1465778:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
772     DFP_HELPER_QUA(DQUA, 64)
773     DFP_HELPER_QUA(DQUAQ, 128)
774
775     static void _dfp_reround(uint8_t rmc, int32_t ref_sig, int32_t xmax,
776                                  struct PPC_DFP *dfp)
777     {

** CID 1465777:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465777:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 474 in helper_DMUL()
468         dfp_check_for_UX(dfp);
469         dfp_check_for_XX(dfp);
470         dfp_check_for_VXSNAN(dfp);
471         dfp_check_for_VXIMZ(dfp);
472     }
473
>>>     CID 1465777:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
474     DFP_HELPER_TAB(DMUL, decNumberMultiply, MUL_PPs, 64)
475     DFP_HELPER_TAB(DMULQ, decNumberMultiply, MUL_PPs, 128)
476
477     static void DIV_PPs(struct PPC_DFP *dfp)
478     {
479         dfp_set_FPRF_from_FRT(dfp);

** CID 1465776:  Uninitialized variables  (UNINIT)


________________________________________________________________________________________________________
*** CID 1465776:  Uninitialized variables  (UNINIT)
/qemu/target/ppc/dfp_helper.c: 975 in helper_DCFFIX()
969     static void CFFIX_PPs(struct PPC_DFP *dfp)
970     {
971         dfp_set_FPRF_from_FRT(dfp);
972         dfp_check_for_XX(dfp);
973     }
974
>>>     CID 1465776:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized element of array "dfp.vt" when calling "set_dfp64".
975     DFP_HELPER_CFFIX(DCFFIX, 64)
976     DFP_HELPER_CFFIX(DCFFIXQ, 128)
977
978     void helper_DCFFIXQQ(CPUPPCState *env, ppc_fprp_t *t, ppc_avr_t *b)
979     {
980         struct PPC_DFP dfp;


________________________________________________________________________________________________________
To view the defects in Coverity Scan visit, https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yrzEQNXe51mg-2FlKoEnRoarMq5nOxxfhqLUuo8HvG2S4Ew-3D-3DSg6y_jyh8IR9bgNkJ4PKr7qLTzFnRqr0RKmg-2FcJU-2Be8u6URh40eXk8SJLpxByEhc-2FHPvIxWyMhydV0vZXVmTzBPZ-2BVSCWViuYLMmAIR5XxZXt2gddgEzb7N6x1gfGuSHCIvV6kxmV1Simlh0-2Bmfyq5CLPlJawKTnzpyg4dxdi-2FLlbQOpDEjeIVkjlDfy4yZP6Z84ED8WJ2owwylUWv9UKU583OA-3D-3D

   To manage Coverity Scan email notifications for "clg@kaod.org", click https://u15810271.ct.sendgrid.net/ls/click?upn=HRESupC-2F2Czv4BOaCWWCy7my0P0qcxCbhZ31OYv50yped04pjJnmXOsUBtKYNIXx2NauWs5WCDfljKrISmdyL3cg6CAsWxhlPW2GrQ5yEq8FBQfE5u-2Bnily3YOA1FIrF-2FXjqndOW6gCSzH3lrjI7CUDJXmDu1YXBzBCHeTNmois-3DlHjg_jyh8IR9bgNkJ4PKr7qLTzFnRqr0RKmg-2FcJU-2Be8u6URh40eXk8SJLpxByEhc-2FHPvIjbRF4qvX56Lxl-2FIsYIV7MvJzyKgtlFiORVpoNTHAF4bT2GOICQrh92bFlFRFLNzT3vgnv5xWnA4F0xRP3ylFyhYSV9ixRU9WHX5ecBJtaDvhA86qWpAdGZ8xo20wbbjh0YwTwKopJn4wVCFSzYm0Rg-3D-3D


