Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A457637C75A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:08:33 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrPU-0006rS-AR
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgrGq-0000TL-Ax
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgrGn-00006n-O2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620835172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tD4Yq80u5T6wYTctCmcFTMkkoBcbhHm0B/zN4mkA7/M=;
 b=GTC/uGh9CqcM3laLJPQCg1kLKsS1509m4h4vqLa31bGUZVSdxCbsMdSJPwm4QiQZOuqPWb
 Phzjab3VBtqZlaC4ZkPbsX9Sf9DERGqsbnssNqSahb5kzP858h+X1Q3pJYlfKRuyoBnqn3
 cTMB8dhpl7jSOmR3Neq1cukCnn54T9g=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-JcqQynZjPm6G5kYslYGCkA-1; Wed, 12 May 2021 11:59:30 -0400
X-MC-Unique: JcqQynZjPm6G5kYslYGCkA-1
Received: by mail-oi1-f200.google.com with SMTP id
 143-20020aca04950000b02901e5c79a4c8fso13076722oie.12
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tD4Yq80u5T6wYTctCmcFTMkkoBcbhHm0B/zN4mkA7/M=;
 b=XCSohwuAbN2P08dtjm/0QY7TCtoJuXQ6rwRirXEsF+hXeuflQTHu1TD0uorl8sg2cO
 QnFLFZKBq+9E/nNUiVia7M++fI1Vp3L+mG8X6173rXrlFYKDiNOMlJmolP6aQdW46pc8
 7nxdO+HNhhaUwsNDUX86N+ssBmO6oAQG0O9OYaJqNE5zOvYeyNQ2bKuVuPr50nSr7j5F
 mphdSIYdvcLT+197tL2VNmlg6g7SJ6jyrI3DHobflVcnrQncJGuVST1onknc8NZ15MMC
 3NjvSsuu2PR6EjiLjh1/JNP6lwd+3eTLunO9aEGpxv7nBYiY6+RgECCwz1lenAHyTRR1
 UDDw==
X-Gm-Message-State: AOAM533vhIG4e2FgdWYWxZmULSN7cscp3uP970ZpOwdqoAXLuX4gTDSq
 q2BYyHHrtXoj5e4RikmuRbd36qWcWMh45pdVEfSDnXNqDoqbm6G7wOS3l3FUjcdUTZdZx+SGEDO
 iBQ5EDfU9+PK96u4=
X-Received: by 2002:a54:4798:: with SMTP id o24mr12862175oic.13.1620835169845; 
 Wed, 12 May 2021 08:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIW6iU+gcvMp49/3l+XSPmHu8AChxtEr6yrJR58X3J3jfGswzOcZF1niEVZifvjZ4rdJAfvQ==
X-Received: by 2002:a54:4798:: with SMTP id o24mr12862162oic.13.1620835169641; 
 Wed, 12 May 2021 08:59:29 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 t22sm36272otd.25.2021.05.12.08.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:59:29 -0700 (PDT)
Subject: Re: [PATCH 1/3] virtiofsd: Find original inode ID of mount points
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210512125544.9536-1-mreitz@redhat.com>
 <20210512125544.9536-2-mreitz@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <cc7c5224-901a-95f0-836e-134eb9c4568b@redhat.com>
Date: Wed, 12 May 2021 10:59:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512125544.9536-2-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:55 AM, Max Reitz wrote:
> Mount point directories represent two inodes: On one hand, they are a
> normal directory on their parent filesystem.  On the other, they are
> the
> root node of the filesystem mounted there.  Thus, they have two inode
> IDs.
> 
> Right now, we only report the latter inode ID (i.e. the inode ID of
> the
> mounted filesystem's root node).  This is fine once the guest has
> auto-mounted a submount there (so this inode ID goes with a device ID
> that is distinct from the parent filesystem), but before the
> auto-mount,
> they have the device ID of the parent and the inode ID for the
> submount.
> This is problematic because this is likely exactly the same
> st_dev/st_ino combination as the parent filesystem's root node.  This
> leads to problems for example with `find`, which will thus complain
> about a filesystem loop if it has visited the parent filesystem's root
> node before, and then refuse to descend into the submount.
> 
> There is a way to find the mount directory's original inode ID, and
> that
> is to readdir(3) the parent directory, look for the mount directory,
> and
> read the dirent.d_ino field.  Using this, we can let lookup and
> readdirplus return that original inode ID, which the guest will thus
> show until the submount is auto-mounted.  (Then, it will invoke
> getattr
> and that stat(2) call will return the inode ID for the submount.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

This is a clever way of uncovering the inode ID.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


