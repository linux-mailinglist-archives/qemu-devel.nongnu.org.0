Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B096DDDC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:26:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEwP-0003hN-5h; Tue, 11 Apr 2023 10:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmEwJ-0003Zz-Je
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmEwG-0000wb-Gk
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681223139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVG8ugxlcSfx7NE3VSUVJIwt509b6TihVFy8KTijur8=;
 b=WAdiHxo1C2gE0X7YvpocekgybHMHm1n8Qubv1lKK2aFywGlKvzXyuycGpdcaPp5qymBpOu
 6CnULWw2+eu8yfXA9t6yTCOhLipJSrBMvEFUhuw+opEW/0HBRzWbRHvNiN/uCPDaqLaLEO
 Dp8FoWNFPrzoGrLOucKqeVKfwfDsCaw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-fiuZLOYDNq2Im4emLJjCPw-1; Tue, 11 Apr 2023 10:25:37 -0400
X-MC-Unique: fiuZLOYDNq2Im4emLJjCPw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f25-20020a50a6d9000000b005049299346fso4380234edc.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVG8ugxlcSfx7NE3VSUVJIwt509b6TihVFy8KTijur8=;
 b=tLTOu+9ED901ZaPiNPJeAKk+wRA1ydBt5ZV5VhS6TF9/UCoYkVai/nYFGCU2MFWz9m
 kKK+cP+uDoMCtpFb7H9HWuozGfT+6UyWFywmYDeGsLIyBsffX4MxhZTyK4mZcc20+P8Q
 2pePjxi7khVU+G+jd9/9YlZCjyS4AUKgXBphdWoQy1HJ+w2VY3fqUbSZVLSB9lc0gdj0
 0o4pemqFzS7FW0vd7X/+W+d0uXFQNfWTMAjJMVZX/rGGeebsalKHU9DapcfyKkgvog05
 8xweXhL5YxcwLuHH4k+lpFBXQzPUl3oczWHcz0+hCQ5twEvE3PUGMyE0jXL2QketgYH6
 /qTg==
X-Gm-Message-State: AAQBX9fvWrBOp2mIQTeuPCdllRA+TrYy3CdQ74bPOCbhUn8MJc4HJj11
 GfE/wxH+x19U/UjA/MAy6+qCDHJd8mEzGAnzKXR4sXYcBMSJvdwBDhTU1cMysEKr5kekxhLidZl
 dvi6UXsKi8Ey50vE=
X-Received: by 2002:a17:907:a583:b0:94a:4012:3501 with SMTP id
 vs3-20020a170907a58300b0094a40123501mr8481407ejc.22.1681223135859; 
 Tue, 11 Apr 2023 07:25:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zmzk7ssI1b+GPs+Zop/LeZ7MgkcbBR/CQuznBg0hQ2NZyYL0OdmWq1q+M1NwkYGCnU7H6oug==
X-Received: by 2002:a17:907:a583:b0:94a:4012:3501 with SMTP id
 vs3-20020a170907a58300b0094a40123501mr8481392ejc.22.1681223135612; 
 Tue, 11 Apr 2023 07:25:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v25-20020a50d599000000b00504b53291fcsm1316111edi.20.2023.04.11.07.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:25:35 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:25:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan Cameron via
 <qemu-devel@nongnu.org>, ani@anisinha.ca, berrange@redhat.com, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [RFC PATCH 0/4] hw/i386: Factor out PXB parts of DSDT into an
 SSDT table
Message-ID: <20230411162534.73d8ec78@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230411100416-mutt-send-email-mst@kernel.org>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
 <20230406112529.00006533@huawei.com>
 <20230407033509-mutt-send-email-mst@kernel.org>
 <20230411160219.64f0aa2f@imammedo.users.ipa.redhat.com>
 <20230411100416-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, 11 Apr 2023 10:05:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 11, 2023 at 04:02:19PM +0200, Igor Mammedov wrote:
> > PS2:
> > Also, I'm working on expanding PCI slots descriptors to PXBs,
> > and more or less that will negate this tables split.   
> 
> Hmm any ETA?  We can defer this discussion until after that is posted.
Hopefully for 8.1.

Goal is to make acpi-index work on PXBs as well
so regardless of where user attaches NIC, interface naming
would still be working as expected.
(i.e. I'm not targeting bringing ACPI hotplug there but that
might be included as a side-effect) 


