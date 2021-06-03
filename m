Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAE39A33C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:32:04 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looOB-0006RT-Ce
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1looLZ-0003di-Q7
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1looLX-0001TR-9o
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622730558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZ5UjjcMNBH9qWvZ9CphSzJ9ML9A0MS+gitZB4CvLJg=;
 b=hToIaZTMDVdzBRnsANFBdnk9scPDSS3uClIAXDXF0Nu//2kcpi3xXVYf/54QOmJKkJQeIe
 NkDsU0TiTp/MeK3z56p0uNvXOV4yLqCqm0kCwCbt9hDQ2HxG63W8tDVI9hOOFSuFOZvp9h
 BfqkljIdSwIT3iyRWCe+P0aHx26zKc0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-qynm96zIM5-vMSKUx7ikxg-1; Thu, 03 Jun 2021 10:29:16 -0400
X-MC-Unique: qynm96zIM5-vMSKUx7ikxg-1
Received: by mail-oi1-f200.google.com with SMTP id
 h133-20020aca538b0000b02901f1a06a6705so3031289oib.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wZ5UjjcMNBH9qWvZ9CphSzJ9ML9A0MS+gitZB4CvLJg=;
 b=g76OX62IJWW3vES34U5iD6goVDxByERQI/ikWuZQg2QXvhFX84vuT/MB8utz8XXLt1
 6ZpDenhrHZ0UC9VVjgtoUWtuU1yXpPma3koWynG7cVYGkkYT2xnBIYhb4+OAQQC0ovcH
 0F2dzKHAreZXae2rSqAl8aAkuxWcw1VgJUvErR1h79UuuDXty9ERLFeutbTA5/IxNdDz
 XfzASNlsXT/G26OA3SkkBgRmGhwxkWzKWEHqw5N1OT7fzQmQkvZ9vBTDVGmrndHqR31j
 C+Mc9y3PQbYBslneB7ZMpFi0aDO5lkeoFOd/1GElow6SdXDpKoVawx1GNKA2CxMUK2W4
 gMLQ==
X-Gm-Message-State: AOAM531Vdfktrv5Zv3EFegDidlS39dnPQCkCvqlRuO7L0I1ESGutLDoo
 EatiUgNy82ap9zs+tWzKz1GrUBsDKS5JSWH6wkYaur6vIWKBBzmubUM42yJMO/dUSkFLF1yfeOJ
 OoD1v4VnoDNYbjBw=
X-Received: by 2002:aca:ab84:: with SMTP id u126mr72567oie.146.1622730555721; 
 Thu, 03 Jun 2021 07:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8+pH+kcK5Ulw+1awhjQQcQEqkRY/WWaMUH6ZWGNXMJq9ZW8NQYA6KCKrJdlk/J1n09k1skw==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr72555oie.146.1622730555573; 
 Thu, 03 Jun 2021 07:29:15 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 m19sm664887oov.10.2021.06.03.07.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 07:29:15 -0700 (PDT)
Subject: Re: [PATCH] sev: sev_get_attestation_report use g_autofree
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, ehabkost@redhat.com, brijesh.singh@amd.com
References: <20210603113017.34922-1-dgilbert@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <6da33f3b-7fdb-707b-540f-4b150a3638a9@redhat.com>
Date: Thu, 3 Jun 2021 09:29:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603113017.34922-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 6:30 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Removes a whole bunch of g_free's and a goto.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


