Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE568E1B4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUIa-0004wx-MM; Tue, 07 Feb 2023 15:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUIX-0004wT-2U
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPUIV-0006jy-PL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECgbF0/hZ++gaCGrH/apoSf3z3ZqYwVLcd0OOZ588Io=;
 b=QQKphr8i9n9fxZx60ZrwtJb6WF2wCOP0BYaSJ2UVPSvhxSYv2ZffQcy8pM6ZzhYaZ257sI
 zNv7mtmBBOZ6StVUFY9oF2IP64JLAKotEKyU6HREz4QouEhVjRJPU19s056s8rlrBkJa6v
 hTm72SVgpmHGPlS86A8PTO5vDnMWBus=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-S9GIY3YtPIStMDDwCxTjAw-1; Tue, 07 Feb 2023 15:10:31 -0500
X-MC-Unique: S9GIY3YtPIStMDDwCxTjAw-1
Received: by mail-qv1-f71.google.com with SMTP id
 pv16-20020ad45490000000b0056bf828babfso3691161qvb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECgbF0/hZ++gaCGrH/apoSf3z3ZqYwVLcd0OOZ588Io=;
 b=z8AgrxNf+Xa2sfuRi6i1nGtmKRUmrT7gmJp7K8YkL2P7DpmO4K+Ax6H6MClqeqNi0s
 BE6PxGP36cLPOLuy6I2EeJeSngs4GRNl0DtS3lxnzzNR1NBQXu4r4clg2GsX5aSu7irW
 XZSTijElSyH15CZ0zHx5Nh+xfR1Twq/GiCRNdTlQux9bEy6TxM5xSuC86Litnbvoq52A
 dZY9xh4KOot4OAKmCxJG4jIVb9D801lpilskfBRI58uEDc9dO9K+6p5P7TffH7JOgg2d
 dtosk7Gi+ig+35PPMGOM+KKnk5PIgRAe1IXNxyrcy1gQ5my3I73HjJrkys2UNIjeuxgG
 qQjA==
X-Gm-Message-State: AO0yUKWIEsCxEtTszIGDDOyuYwC3FT6YtbuMVb2Oy1P06is7YpvDtWA7
 zLEwlMSbVNHNoHzy7q8YOSKo/RQguCrRFkkd3Gm0kNoCGF4gErw8cwRjMRkf69vLeJBJo7/9o5X
 ZBMaWenTay03N7Ug=
X-Received: by 2002:a05:622a:4d2:b0:3b6:35cb:b944 with SMTP id
 q18-20020a05622a04d200b003b635cbb944mr8874256qtx.2.1675800630497; 
 Tue, 07 Feb 2023 12:10:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/KNQR4cLLuZ68t/2I/5EAlUNWTCFDGIWI8+6XodaCXOjAb0MCsmf9wmEh+3KYFn0CwwaK1HQ==
X-Received: by 2002:a05:622a:4d2:b0:3b6:35cb:b944 with SMTP id
 q18-20020a05622a04d200b003b635cbb944mr8874209qtx.2.1675800630221; 
 Tue, 07 Feb 2023 12:10:30 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 k19-20020ac85fd3000000b003b0766cd169sm10419331qta.2.2023.02.07.12.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:10:29 -0800 (PST)
Date: Tue, 7 Feb 2023 15:10:28 -0500
From: Peter Xu <peterx@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V2] memory: flat section iterator
Message-ID: <Y+KwNN9v81aLKct2@x1n>
References: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 07, 2023 at 11:03:29AM -0800, Steve Sistare wrote:
> Add an iterator over the sections of a flattened address space.
> This will be needed by cpr to issue vfio ioctl's on the same memory
> ranges that are already programmed.

Should this better be proposed with the context of using it?  Or I don't
know how to justify this new interface is needed.

For example, any explanations on why memory region listeners cannot work?

Thanks,

-- 
Peter Xu


