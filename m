Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC3456ECF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:28:20 +0100 (CET)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo308-0000Hv-1B
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2yq-00071J-Pw
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2yo-0001EQ-Ag
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637324817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9FPWE2CUywOEu53ZgDDJnwUX/QDPP5MFXnNzwq8ZXAo=;
 b=RXNC532H/WkTwSoI1N6WZ8ietrZfB+WlVLICMEoWpJpjcypyGng6sGzEoiJozPi55dk+/1
 tt4FnSJPJWj+gzlQ6XWXWfyxHD00ABBbJrC4ShGM1IXPZGa2WuWbFBEQAgfXJSmdCWu6Ox
 9+yhphKD5FPGfl2zTucoZiuNOxk9LAA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-sVQ23c8lMS6Iq8VxT5pdSw-1; Fri, 19 Nov 2021 07:26:56 -0500
X-MC-Unique: sVQ23c8lMS6Iq8VxT5pdSw-1
Received: by mail-pj1-f70.google.com with SMTP id
 b11-20020a17090acc0b00b001a9179dc89fso6612406pju.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 04:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FPWE2CUywOEu53ZgDDJnwUX/QDPP5MFXnNzwq8ZXAo=;
 b=iExRBFeTyPBzlRGRCr9WcusXX6RhjOWU8/uxycvybPBAqSU/9uVovBsfrRJqn0yWHJ
 odU0VU15s5TrDax5OqnEafDOV65bYq6Ixh+BtZiHkB+rjUbiDZrB0KzsZ6RYhy1RjdTO
 ppWXuUQrMsXidB+OHV53B015Q1Ox2BTX7K2vvmZImxPYYBgVmKMpaiec2R3tJKrkEU5F
 sElF5gdsoKi+JM2tdl6kQScDqT+OqQCgzkimS+Nx0xboHKm4OpBVQEFQAfEIn/I5xfUY
 ywDNF0ibYD/O9KIrNSYrVG8qqOqiR524lGGGNT0lEeHhTUAvbQACEYyxYc3zyEUY/z5a
 m1Cw==
X-Gm-Message-State: AOAM5326BlMGt0uqHDADJLmZcuhLuk/z/zm5xVbeXZEJmQ9FtID2RU+i
 Gg/Ao0v5urWgNm5YQmPL7/Ht18Ruplw03XyjKAKtuxokgzS/iOCBS7tMbKNnRviSev56Cf8BQgs
 BA2D+rxwOuCcjIc48ryzpBefOssC763A=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr4220859pjb.203.1637324815031; 
 Fri, 19 Nov 2021 04:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWKk2N8WdYLQ2A7eWojAfBe3cPibFEgFtlyAeZ1giUp+VqDODZ2L/mNJbE75+fh767DJpm4HJpZXSm1p3CGF0=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr4220827pjb.203.1637324814768; 
 Fri, 19 Nov 2021 04:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-5-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-5-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 09:26:28 -0300
Message-ID: <CAKJDGDZX0yTE38d+Bf3NcEVQyQyYZAOqdB_KjcgNj7tX=P2YhA@mail.gmail.com>
Subject: Re: [PATCH 4/7] python/machine: move more variable initializations to
 _pre_launch
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 5:51 PM John Snow <jsnow@redhat.com> wrote:
>
> No need to clear them only to set them later.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


