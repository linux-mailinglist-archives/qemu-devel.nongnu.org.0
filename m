Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CC544C96
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:51:26 +0200 (CEST)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHdF-000119-RW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzFPt-0000t9-0B
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzFPr-0001zd-BZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654770566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F70o4K3WckAkYqzq9pfETNuPlH49hvzy93Z3t3uqzEk=;
 b=OFSmMQ1agWDlSM7uZHGeBmA44RTORh14g5xmQ9Kdx15LOdRH3TDiQ6sIbO7eilBU/wM4hS
 IErGMBKH6Rz8F97RNwIXNBDLBgjpDb8cqevqyYIwytFFCZIZzFJfVki1AfDsCvscQR7vIo
 Z2c8IwuC/avtty18YIHQCyLVSEa5xhI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-2Fgz0RMeNOKtFb5FHJUGaA-1; Thu, 09 Jun 2022 06:29:25 -0400
X-MC-Unique: 2Fgz0RMeNOKtFb5FHJUGaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so15789109wmb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=F70o4K3WckAkYqzq9pfETNuPlH49hvzy93Z3t3uqzEk=;
 b=x9CCRpR2oA4qpxlb2+fUY0twL4YOc6amG1WBSxj12GgP9snyZJH80WHVgdiatlR0ME
 CcaNlMHVb4gnUbhL3ejAdY5s/tINlBUgwFIOQOO4Unw0rAZ0+Lh94y4AQebPuMILoHVw
 5yypnV3sE8TT3VeWUm5xoHPMJkPXnr9ZR1gcxME/aytAfzgiZLyEsi+VmR4+S/c6mQLL
 BQx/aXctymHmzmn4R2/XUCii9M2X2ogaKdNrf36tQHMuI/IFd8pvBRVtQt/IOBlAldS7
 5GXOciAWwOJz5MTIr51Q0aUR8g1/WEwAGSUQhsB4W8Il0qDdqxqvkG9+SC3Ohj0DXa/g
 w1Wg==
X-Gm-Message-State: AOAM530dJ+P7oJuXiOYtcol9MK7kWk/B5PGAVWq09Ef/vcbK+WnyDDp5
 KNup0UzC8FXRlXxVfXNj7PZSHzIQXeipdOU3A4R/FHW7fkkdfNtdd33xw/n2Up/oIoVpZVTKjUs
 6KIDGsl57xDoF2mc=
X-Received: by 2002:a05:6000:1786:b0:217:c304:9f6b with SMTP id
 e6-20020a056000178600b00217c3049f6bmr23422830wrg.323.1654770562804; 
 Thu, 09 Jun 2022 03:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybG2LP8dxr7sDLgT8W2vbztLxN1VwxwFr4LWf00WMj6q3XEC890ijX6v0tLxh2pRSSVht4mA==
X-Received: by 2002:a05:6000:1786:b0:217:c304:9f6b with SMTP id
 e6-20020a056000178600b00217c3049f6bmr23422796wrg.323.1654770562495; 
 Thu, 09 Jun 2022 03:29:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x11-20020a5d6b4b000000b00219c46089f6sm176217wrw.64.2022.06.09.03.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 03:29:21 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:29:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 07/20] migration: rename qemu_update_position to
 qemu_file_credit_transfer
Message-ID: <YqHLf9grjT46lnpI@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-8-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-8-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The qemu_update_position method name gives the misleading impression
> that it is changing the current file offset. Most of the files are
> just streams, however, so there's no concept of a file offset in the
> general case.
> 
> What this method is actually used for is to report on the number of
> bytes that have been transferred out of band from the main I/O methods.
> This new name better reflects this purpose.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.c | 4 ++--
>  migration/qemu-file.h | 8 +++++++-
>  migration/ram.c       | 2 +-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 664ac77067..9a7f715e17 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -319,7 +319,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>          if (ret != RAM_SAVE_CONTROL_DELAYED &&
>              ret != RAM_SAVE_CONTROL_NOT_SUPP) {
>              if (bytes_sent && *bytes_sent > 0) {
> -                qemu_update_position(f, *bytes_sent);
> +                qemu_file_credit_transfer(f, *bytes_sent);
>              } else if (ret < 0) {
>                  qemu_file_set_error(f, ret);
>              }
> @@ -374,7 +374,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>      return len;
>  }
>  
> -void qemu_update_position(QEMUFile *f, size_t size)
> +void qemu_file_credit_transfer(QEMUFile *f, size_t size)
>  {
>      f->total_transferred += size;
>  }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index febc961aa9..81f6fd7db8 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -186,7 +186,13 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
>   */
>  int qemu_peek_byte(QEMUFile *f, int offset);
>  void qemu_file_skip(QEMUFile *f, int size);
> -void qemu_update_position(QEMUFile *f, size_t size);
> +/*
> + * qemu_file_credit_transfer:
> + *
> + * Report on a number of bytes that have been transferred
> + * out of band from the main file object I/O methods.
> + */
> +void qemu_file_credit_transfer(QEMUFile *f, size_t size);
>  void qemu_file_reset_rate_limit(QEMUFile *f);
>  void qemu_file_update_transfer(QEMUFile *f, int64_t len);
>  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> diff --git a/migration/ram.c b/migration/ram.c
> index 89082716d6..bf321e1e72 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2301,7 +2301,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
>      } else {
>          ram_counters.normal += pages;
>          ram_transferred_add(size);
> -        qemu_update_position(f, size);
> +        qemu_file_credit_transfer(f, size);
>      }
>  }
>  
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


