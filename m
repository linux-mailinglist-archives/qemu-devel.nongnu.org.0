Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A25FB2D1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:02:36 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEu3-0005NM-Fm
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDMF-000671-Hm
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDM8-0000mi-MS
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnVb8RIalMFEezHl0SKSSQ3B3Wq/64sITXH+W9lRx4o=;
 b=eirv28eLYRBpdRCQtG32JX7+1ArtdahXzstB1r+slJUDfrgqk4d8yX9AX97KqFZb2YgnJL
 YVe08F9LLKImsLZabQVuhBCyq1rh4ZmAKgrAePm2YynD5CJVL/6TPHgC14ldG6NNSHt4Rh
 +qOAPKskkCkmLSmBHNeGPALQI5F/gho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-Np7e_z23NESaUKBEBNsm4Q-1; Tue, 11 Oct 2022 07:23:26 -0400
X-MC-Unique: Np7e_z23NESaUKBEBNsm4Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 e14-20020adf9bce000000b0022d18139c79so3713561wrc.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XnVb8RIalMFEezHl0SKSSQ3B3Wq/64sITXH+W9lRx4o=;
 b=rImPoBM0yD2X+kGHMpIF6ZF1SNl69TNcykBtdtKUfU+VjKlpoTWICBssEx5iqs2NFq
 YLew+Q3eIfiNTNne3q6ZrPIzVrZ0oxBH3TL2WWFid7gUWI+GTywjnD1hbTM2KQtDn+Vm
 G0cODUzWTeMYK7vjuciOXYuiHYGv+ijeP1yk/S4908/G4r/szRPJU5SEKPFcd+cWi/PZ
 NhJLqz5sHiZyhXQgquPe+rH8RcZAmI5ObDhcFgUCkKUKkOrcSgsBuCiZKpGEWvFvXVMw
 Cl1KXn02AkAKMzeWEYfn602CjqjJJM/7GuThAGY4WNrCcEMEffi/i3rAJbMBfVNImOl5
 vmmw==
X-Gm-Message-State: ACrzQf257OBbab0C8f5zbgfnyIJ2pX7XuHQbQ78gMTHSSoRr6UhQiFcy
 +nwKkZfCXewxJhbSWesGxSOMBMvditdC+TvVFQKLhJRuCGiNk4Pw78lI5rhJbDNdv42on4kudHj
 FIH5lckafcCcyyqU=
X-Received: by 2002:a5d:6d07:0:b0:22f:81f9:9c73 with SMTP id
 e7-20020a5d6d07000000b0022f81f99c73mr10925721wrq.76.1665487405330; 
 Tue, 11 Oct 2022 04:23:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4RN4zPpyIBLIx4Xc8CNdrIaDAFrs+mWUj0RTQ+8YthvBKsGeeaqNal5pmsGm+Aw+BKJ/aOXw==
X-Received: by 2002:a5d:6d07:0:b0:22f:81f9:9c73 with SMTP id
 e7-20020a5d6d07000000b0022f81f99c73mr10925664wrq.76.1665487404252; 
 Tue, 11 Oct 2022 04:23:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d5586000000b00228a6ce17b4sm11088869wrv.37.2022.10.11.04.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:23:23 -0700 (PDT)
Message-ID: <19e4252d-5efc-fb09-c714-ffda4a3b5203@redhat.com>
Date: Tue, 11 Oct 2022 13:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 4/9] tests/x86: Add 'q35' machine type to
 override-tests in hd-geo-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-5-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-5-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/hd-geo-test.c | 97 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 61f4c24b81..278464c379 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -741,6 +741,27 @@ static void test_override_ide(void)
>       test_override(args, "pc", expected);
>   }
>   
> +static void test_override_sata(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {"/pci@i0cf8/pci8086,2922@1f,2/drive@0/disk@0", {10000, 120, 30} },
> +        {"/pci@i0cf8/pci8086,2922@1f,2/drive@1/disk@0", {9000, 120, 30} },
> +        {"/pci@i0cf8/pci8086,2922@1f,2/drive@2/disk@0", {0, 1, 1} },
> +        {"/pci@i0cf8/pci8086,2922@1f,2/drive@3/disk@0", {1, 0, 0} },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_ide_disk(args, 0, 0, 0, 10000, 120, 30);
> +    add_ide_disk(args, 1, 1, 0, 9000, 120, 30);
> +    add_ide_disk(args, 2, 2, 0, 0, 1, 1);
> +    add_ide_disk(args, 3, 3, 0, 1, 0, 0);
> +    test_override(args, "q35", expected);
> +}
> +
>   static void test_override_scsi(void)
>   {
>       TestArgs *args = create_args();
> @@ -763,6 +784,42 @@ static void test_override_scsi(void)
>       test_override(args, "pc", expected);
>   }
>   
> +static void setup_pci_bridge(TestArgs *args, const char *id, const char *rootid)
> +{
> +
> +    char *root, *br;
> +    root = g_strdup_printf("-device pcie-root-port,id=%s", rootid);
> +    br = g_strdup_printf("-device pcie-pci-bridge,bus=%s,id=%s", rootid, id);
> +
> +    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, root);
> +    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, br);
> +}
> +
> +static void test_override_scsi_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {   "/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@0,0",
> +            {10000, 120, 30}
> +        },
> +        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@1,0", {9000, 120, 30} },
> +        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@2,0", {1, 0, 0} },
> +        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@3,0", {0, 1, 0} },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    setup_pci_bridge(args, "pcie.0", "br");
> +    add_scsi_controller(args, "lsi53c895a", "br", 3);
> +    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
> +    add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
> +    add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
> +    add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
> +    test_override(args, "q35", expected);
> +}
> +
>   static void test_override_scsi_2_controllers(void)
>   {
>       TestArgs *args = create_args();
> @@ -801,6 +858,22 @@ static void test_override_virtio_blk(void)
>       test_override(args, "pc", expected);
>   }
>   
> +static void test_override_virtio_blk_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {"/pci@i0cf8/pci-bridge@1/scsi@3/disk@0,0", {10000, 120, 30} },
> +        {"/pci@i0cf8/pci-bridge@1/scsi@4/disk@0,0", {9000, 120, 30} },
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    setup_pci_bridge(args, "pcie.0", "br");
> +    add_virtio_disk(args, 0, "br", 3, 10000, 120, 30);
> +    add_virtio_disk(args, 1, "br", 4, 9000, 120, 30);
> +    test_override(args, "q35", expected);
> +}
> +
>   static void test_override_zero_chs(void)
>   {
>       TestArgs *args = create_args();
> @@ -812,6 +885,17 @@ static void test_override_zero_chs(void)
>       test_override(args, "pc", expected);
>   }
>   
> +static void test_override_zero_chs_q35(void)
> +{
> +    TestArgs *args = create_args();
> +    CHSResult expected[] = {
> +        {NULL, {0, 0, 0} }
> +    };
> +    add_drive_with_mbr(args, empty_mbr, 1);
> +    add_ide_disk(args, 0, 0, 0, 0, 0, 0);
> +    test_override(args, "q35", expected);
> +}
> +
>   static void test_override_hot_unplug(TestArgs *args, const char *devid,
>                                        CHSResult expected[], CHSResult expected2[])
>   {
> @@ -944,6 +1028,19 @@ int main(int argc, char **argv)
>                          test_override_scsi_hot_unplug);
>           qtest_add_func("hd-geo/override/virtio_hot_unplug",
>                          test_override_virtio_hot_unplug);
> +
> +        if (qtest_has_machine("q35")) {
> +            qtest_add_func("hd-geo/override/sata", test_override_sata);
> +            qtest_add_func("hd-geo/override/virtio_blk_q35",
> +                           test_override_virtio_blk_q35);
> +            qtest_add_func("hd-geo/override/zero_chs_q35",
> +                           test_override_zero_chs_q35);
> +
> +            if (qtest_has_device("lsi53c895a")) {
> +                qtest_add_func("hd-geo/override/scsi_q35",
> +                               test_override_scsi_q35);
> +            }
> +        }
>       } else {
>           g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
>                          "skipping hd-geo/override/* tests");

Acked-by: Thomas Huth <thuth@redhat.com>


