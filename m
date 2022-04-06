Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955254F57CB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:34:28 +0200 (CEST)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc17T-0004xG-La
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc11F-00019h-Ot
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc11E-00045j-8Q
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649233675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dT6pTr2A2yeRXyewVPyL6ks2W8BCwHPhVGTcRvdAnPo=;
 b=h+so/1dPduJ5uLf7AQcwOYnl9vjIt8owc6WDISO2R96NzkIlWZQ7Ha6NAvwaLSNMR9uRty
 UQbGrDD4Vrzo7daPxCeyhpYMCM3Ogg3Z8JKRxfH9YRvKHcQVt75TNG4sVR3DgR9xf6sdJB
 7V2d+RJeh6y6ddzPTMC9HUdLnaJv/+k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-shxuPxruPDqTeJaMtE8zPw-1; Wed, 06 Apr 2022 04:27:54 -0400
X-MC-Unique: shxuPxruPDqTeJaMtE8zPw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so987490wmq.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 01:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dT6pTr2A2yeRXyewVPyL6ks2W8BCwHPhVGTcRvdAnPo=;
 b=6AvRdbxrVSlX45q95fOKhYgcT5tLOaMHEzNbXen901rgR44F7xJmzrHLFWYvLBF0UX
 XU8hf8uXGwzsxyt1myD0KIoBSjsIzxBDXP6I+uACcqrXi1Q5n4zmo6NCOs2RHKxaxaQn
 8A7q0a1o04+8nVqae8oUmYwzaREt2wyEOrHjCmNmoZsYycECTsk2V+WMwlgGiWjAIPk+
 G4Aa0pz2lG4/SuptIvtdqM/wGZo7Hhf8iekWWCt0tNEkTIe2X/DCS2NAtXlo3jUjwNWv
 KBztNG48Sv7QlbcxRGU4rMI5YTi5tT3KN7QV8d39M6kp3aUFuqHT3Zap56EP4i5mkEdf
 ZnAg==
X-Gm-Message-State: AOAM531NC5dHOcg4X6MzwYbwPGPP7ysqD9eg7zd9WhVkTuViMEZ7gXLz
 5PkYF5P6C7dDbrH9yXtJ88BcOdtcpRrwNp/2LYSB9LraU5LIqpNkmp8BYfW3+7TzuSULMFFRc7D
 9BoPKtNr4KVTMEgKeZqJssh28qqQPcbQnaJ0z0IqN1IsimDEnU8dci2+uiT2mb3pY6s0=
X-Received: by 2002:a05:6000:144d:b0:205:8905:4cc1 with SMTP id
 v13-20020a056000144d00b0020589054cc1mr5765659wrx.508.1649233672541; 
 Wed, 06 Apr 2022 01:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvWxgBKLK/UA+6Akr5vAaqw/wDQyrHsN6iamwtexdt1IvJzyOmupggM0z0vZYcuErB9xYo2g==
X-Received: by 2002:a05:6000:144d:b0:205:8905:4cc1 with SMTP id
 v13-20020a056000144d00b0020589054cc1mr5765632wrx.508.1649233672265; 
 Wed, 06 Apr 2022 01:27:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c144a00b0038ccc75a6adsm4148152wmi.37.2022.04.06.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:27:51 -0700 (PDT)
Date: Wed, 6 Apr 2022 09:27:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk1PBRjk4Pz/rl5F@work-vm>
References: <20220406082520.9528-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406082520.9528-1-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, leobras@redhat.com, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:

Hmm no, still bad mimetype
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


