Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856655E55A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:35:46 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CJd-0004TQ-1m
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6CHd-0003VZ-5c
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6CHZ-0006NZ-Fz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656426816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cjf83JcYSDJEgL/xHTCuYMCj5fAChXkNd5DDlhSlsqE=;
 b=etCM2jDiw6Lj6Jx+Px/jPFTWKXlzGQPtxb8dXlNaRmJUPwcSFHPowc1OAWXJo3g8RaS0O7
 4qbF6tm9H98IbgyFRFgXMOAuFmCEXcGlmJChMG2DYKMTHZGLUwBVP2BFYVuUngMluwyMjn
 D3FmFNf9CTEH3ZzJHjYtSODb9zGrT1s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-FvgYyaQbMWWjU-BuDNVG2g-1; Tue, 28 Jun 2022 10:33:35 -0400
X-MC-Unique: FvgYyaQbMWWjU-BuDNVG2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so7214451wmj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cjf83JcYSDJEgL/xHTCuYMCj5fAChXkNd5DDlhSlsqE=;
 b=0yPhBysGW00zAIQUb6GEFwO/ymmNIKe3uogRuBUk/4aZ4owDGjtGJzPu+ghR+BToL9
 UfeZqiuAB3lJdrmGh7tHf0SAf8ygejRA4oMzPxbvwn0MH/ft3Sr2FOsqGMwT7XnM+7/+
 90X+nFlPGwrZkJVNpDSKrRwhQGKBWjmm/j9SWszW7mIgFR2S6Jkha7JuC/sqBHmOZYQE
 MJMsW8Ihkh+wFUo26tMpTk0xETCU/v0gqEdRrvRzoGxuO2tYBvQfVeD2/hW1WfAPqKzH
 S2qsRqaZdWS9ESLPvyFH55L0qoRfQA98B8oFK2pCGCgxUoYcdClyoWfHUzvp226lHFoR
 j3lg==
X-Gm-Message-State: AJIora/l4F+SZE63n+hpkyK17DdwDKWtg3S1oeWRa4pxEtjMJxiCqydq
 C4Qvao0JU2bzBFWqpEXdjWqRSFm1O06WisHsEh3XWnrOOGG1gVEGFx3RdX7f9V56uuvxY8ZnBRa
 cdyyaCOkPVwgblwk=
X-Received: by 2002:a05:6000:691:b0:21b:8d0a:6035 with SMTP id
 bo17-20020a056000069100b0021b8d0a6035mr18265504wrb.230.1656426812490; 
 Tue, 28 Jun 2022 07:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3H2/C1nsv8wGAG8gA1abNxAqaMP1h9rdCAnDHmmVlRlrJMDc/Hc+x403zXzkbHG07NtXUUw==
X-Received: by 2002:a05:6000:691:b0:21b:8d0a:6035 with SMTP id
 bo17-20020a056000069100b0021b8d0a6035mr18265464wrb.230.1656426812045; 
 Tue, 28 Jun 2022 07:33:32 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0039c7dbafa7asm22052016wms.19.2022.06.28.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:33:31 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:33:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 3/4] tests: acpi: q35: add test for hmat nodes without
 initiators
Message-ID: <20220628163330.43ae22b5@redhat.com>
In-Reply-To: <919b45dd-9f21-85f9-fb05-f71a9da805e7@inria.fr>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
 <919b45dd-9f21-85f9-fb05-f71a9da805e7@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jun 2022 16:59:29 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

maybe add a description of what you are testing


something along:
  machine with X numa nodes configured like this or that ...



> expected HMAT:
> 
> [000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
> [004h 0004   4]                 Table Length : 00000120
> [008h 0008   1]                     Revision : 02
> [009h 0009   1]                     Checksum : 4F
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
> 
> [024h 0036   4]                     Reserved : 00000000
> 
> [028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [02Ah 0042   2]                     Reserved : 0000
> [02Ch 0044   4]                       Length : 00000028
> [030h 0048   2]        Flags (decoded below) : 0001
>              Processor Proximity Domain Valid : 1
> [032h 0050   2]                    Reserved1 : 0000
> [034h 0052   4] Attached Initiator Proximity Domain : 00000000
> [038h 0056   4]      Memory Proximity Domain : 00000000
> [03Ch 0060   4]                    Reserved2 : 00000000
> [040h 0064   8]                    Reserved3 : 0000000000000000
> [048h 0072   8]                    Reserved4 : 0000000000000000
> 
> [050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [052h 0082   2]                     Reserved : 0000
> [054h 0084   4]                       Length : 00000028
> [058h 0088   2]        Flags (decoded below) : 0001
>              Processor Proximity Domain Valid : 1
> [05Ah 0090   2]                    Reserved1 : 0000
> [05Ch 0092   4] Attached Initiator Proximity Domain : 00000001
> [060h 0096   4]      Memory Proximity Domain : 00000001
> [064h 0100   4]                    Reserved2 : 00000000
> [068h 0104   8]                    Reserved3 : 0000000000000000
> [070h 0112   8]                    Reserved4 : 0000000000000000
> 
> [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
> [07Ah 0122   2]                     Reserved : 0000
> [07Ch 0124   4]                       Length : 00000028
> [080h 0128   2]        Flags (decoded below) : 0000
>              Processor Proximity Domain Valid : 0
> [082h 0130   2]                    Reserved1 : 0000
> [084h 0132   4] Attached Initiator Proximity Domain : 00000080
> [088h 0136   4]      Memory Proximity Domain : 00000002
> [08Ch 0140   4]                    Reserved2 : 00000000
> [090h 0144   8]                    Reserved3 : 0000000000000000
> [098h 0152   8]                    Reserved4 : 0000000000000000
> 
> [0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0A2h 0162   2]                     Reserved : 0000
> [0A4h 0164   4]                       Length : 00000040
> [0A8h 0168   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0A9h 0169   1]                    Data Type : 00
> [0AAh 0170   2]                    Reserved1 : 0000
> [0ACh 0172   4] Initiator Proximity Domains # : 00000002
> [0B0h 0176   4]   Target Proximity Domains # : 00000003
> [0B4h 0180   4]                    Reserved2 : 00000000
> [0B8h 0184   8]              Entry Base Unit : 0000000000002710
> [0C0h 0192   4] Initiator Proximity Domain List : 00000000
> [0C4h 0196   4] Initiator Proximity Domain List : 00000001
> [0C8h 0200   4] Target Proximity Domain List : 00000000
> [0CCh 0204   4] Target Proximity Domain List : 00000001
> [0D0h 0208   4] Target Proximity Domain List : 00000002
> [0D4h 0212   2]                        Entry : 0001
> [0D6h 0214   2]                        Entry : 0002
> [0D8h 0216   2]                        Entry : 0003
> [0DAh 0218   2]                        Entry : 0002
> [0DCh 0220   2]                        Entry : 0001
> [0DEh 0222   2]                        Entry : 0003
> 
> [0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
> [0E2h 0226   2]                     Reserved : 0000
> [0E4h 0228   4]                       Length : 00000040
> [0E8h 0232   1]        Flags (decoded below) : 00
>                              Memory Hierarchy : 0
> [0E9h 0233   1]                    Data Type : 03
> [0EAh 0234   2]                    Reserved1 : 0000
> [0ECh 0236   4] Initiator Proximity Domains # : 00000002
> [0F0h 0240   4]   Target Proximity Domains # : 00000003
> [0F4h 0244   4]                    Reserved2 : 00000000
> [0F8h 0248   8]              Entry Base Unit : 0000000000000001
> [100h 0256   4] Initiator Proximity Domain List : 00000000
> [104h 0260   4] Initiator Proximity Domain List : 00000001
> [108h 0264   4] Target Proximity Domain List : 00000000
> [10Ch 0268   4] Target Proximity Domain List : 00000001
> [110h 0272   4] Target Proximity Domain List : 00000002
> [114h 0276   2]                        Entry : 000A
> [116h 0278   2]                        Entry : 0005
> [118h 0280   2]                        Entry : 0001
> [11Ah 0282   2]                        Entry : 0005
> [11Ch 0284   2]                        Entry : 000A
> [11Eh 0286   2]                        Entry : 0001
> 
> Raw Table Data: Length 288 (0x120)
> 
>      0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....OBOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
>      0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(...........
>      0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
>      0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ................
>      0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@...........
>      00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'......
>      00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
>      00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ................
>      00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@...........
>      00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
>      0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
>      0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ................
> 
> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
> ---
>   tests/qtest/bios-tables-test.c | 45 ++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 359916c228..1252b166ff 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1461,6 +1461,50 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>       test_acpi_tcg_acpi_hmat(MACHINE_PC);
>   }
>   
> +static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_Q35;
> +    data.variant = ".acpihmat-noinitiator";
> +    test_acpi_one(" -machine hmat=on"
> +                  " -smp 4"
> +                  " -m 128M"
> +                  " -object memory-backend-ram,size=32M,id=ram0"
> +                  " -object memory-backend-ram,size=32M,id=ram1"
> +                  " -object memory-backend-ram,size=64M,id=ram2"

> +                  " -numa node,nodeid=0,memdev=ram0,cpus=0-1"
> +                  " -numa node,nodeid=1,memdev=ram1,cpus=2-3"

drop legacy cpus=foo and replace it with '-numa cpu'
(you can find examples in this file or tests/qtest/numa-test.c )


> +                  " -numa node,nodeid=2,memdev=ram2"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_acpi_erst(const char *machine)
>   {
>       gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
> @@ -1803,6 +1847,7 @@ int main(int argc, char *argv[])
>           qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>           qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>           qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/q35/acpihmat-noinitiator", test_acpi_q35_tcg_acpi_hmat_noinitiator);

should be aligned with the rest of the block

>           qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
>           qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>           qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);


