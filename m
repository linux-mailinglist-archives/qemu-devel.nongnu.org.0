Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D5428F65
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:56:26 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvn0-0005iv-1r
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZvlB-0004Kn-CD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZvl9-0006nu-M4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633960471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQHWuiopO4baMCfybZVMnTr1Hk1X2JtpZd8kyXFHd9U=;
 b=HTS+l9yBlFoJQdbRY9gzValxHzodJ4tRX6g1gsfN/P5HXGbwK7VGJPA7R56lpbhgOk/dx0
 mT7byrQvLvNeFoUMPt4DMo5jv0r2SDJiTkjY6sal9j7YEunKhA7cfd0tmIqeTxHVBOYqte
 afT8MeY40wH493SsPpvNO0jmHjY46lc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-xIuVZ-GmMNys_UiHXhD4Mw-1; Mon, 11 Oct 2021 09:54:29 -0400
X-MC-Unique: xIuVZ-GmMNys_UiHXhD4Mw-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so13923973edy.14
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQHWuiopO4baMCfybZVMnTr1Hk1X2JtpZd8kyXFHd9U=;
 b=Hwfsmu/ioy7sQE4BTEK7f8JhcPnPXWIJjPtH1wGnDPYeEo/tWWHrcQbzSAAG5+ZxDA
 1PI3RsPe9OM0FAzvZ5P+HJZbN+grNGSQnBynjzWZRBNsf06Y0rv0tL2rdeYg6YCV70XI
 SIve9AdSENzaIp3HRPgpXjSKRdYMRECVDf8qGf1ar1q/vtqwX+3fjlxMzlsvfnZGx6IZ
 qxZ17Fhj3bkGqFW0sng/P2CBX0BP9k00zRhDCHBqy6Q90EEei+GG04lgUdDWCycY8kjd
 b5Pr5GNWUZ2PlQaOFiXz2ajSWlo6OL9l61zBG1Uau+ZKO3YGZnX5IlGgNT2a1VALFVLd
 OIyA==
X-Gm-Message-State: AOAM5324KvaUFXK/Tb65UKhcsAjoZD+xA4+dDxS0Sj53wZ2T5blA5YzL
 vB6QacqzY4FApQUo9nhTitP1VlJ6H3SGSDGpD4PE6LKl+BwcLc3Uod+BBrya/9tntIEMp/klh/k
 JQyIW7Yvee9lZQYQ=
X-Received: by 2002:a50:9e84:: with SMTP id a4mr15575068edf.391.1633960468690; 
 Mon, 11 Oct 2021 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRp89nKRple/LHCR0kcbMDDmemjpPTEvz8AjLKY5L/mu2T2Yu7W8Edt+CLf9CPT32dJ2W8qA==
X-Received: by 2002:a50:9e84:: with SMTP id a4mr15575047edf.391.1633960468534; 
 Mon, 11 Oct 2021 06:54:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j22sm3548778ejt.11.2021.10.11.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:54:28 -0700 (PDT)
Date: Mon, 11 Oct 2021 15:54:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 1/3] tests/acpi/bios-tables-test: add and allow
 changes to a new q35 DSDT table blob
Message-ID: <20211011155427.07c4654e@redhat.com>
In-Reply-To: <20211007135750.1277213-2-ani@anisinha.ca>
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211007135750.1277213-2-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  7 Oct 2021 19:27:48 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> We are adding a new unit test to cover the acpi hotplug support in q35 for
> multi-function bridges. This test uses a new table DSDT.multi-bridge.
> We need to allow changes in DSDT acpi table for addition of this new
> unit test.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/DSDT.multi-bridge       | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> 
> diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..dabc024f53 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.multi-bridge",


