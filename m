Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7F456EC7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:25:09 +0100 (CET)
Received: from localhost ([::1]:49586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2x2-0004xJ-LU
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2vU-00043M-9p
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:23:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2vR-0000h0-0o
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637324608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGJGhdB0zxR/D4nrIOTUN7jxOv9nE0cl/sqwnceYwvg=;
 b=FMw/hwO6VTl/b8KvP+Ok2EIzhN+Z5ap0VLJ2naWucidyoSmPjlHtlvDc5KMEwPVQXqE5fi
 5iKr2HaGeBLm3SPVSTz/LxTwiBd5Bw9LKap6ivjanEVFfPqg09fbQHbSzaswJ/3SQd1bPe
 ASUiytfe37Qg0o384kjTMi9TxLb5MjQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-uXDI2v2vONS6vZZLtcEJ3g-1; Fri, 19 Nov 2021 07:23:27 -0500
X-MC-Unique: uXDI2v2vONS6vZZLtcEJ3g-1
Received: by mail-pf1-f200.google.com with SMTP id
 y124-20020a623282000000b0047a09271e49so5545132pfy.16
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 04:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGJGhdB0zxR/D4nrIOTUN7jxOv9nE0cl/sqwnceYwvg=;
 b=Juqam9QjiEalTfGEuO2JW3b+kUUqy9hehYN+obFbL6d8+aBbC+fhSz6aC/0T8dNmZT
 Q+zmNEj0BqCausNm3a4vQbnf04h/RWVELRbR8w+EGEq9w9zIQeucPrH6jm/L+pWFuzFR
 ICYDD/uV8FjiejLa+fojCGjszHKUmULaZtK2FZz3jh0ETN0wrJtDWHNp0WfDQbCR8inI
 UjT/Aa9lBIvP5yh2dDavzRbgdI3ws2grWlccEKcnrBtWX7uQEiJNkxcaN/XhjjWDdTk6
 KsA/st37Zn9+pYFsN8OKwPE8A9oXGbBSVm+p4ut7q5tx11rkY/SI/ohetfoQ/U22aQHe
 1J0w==
X-Gm-Message-State: AOAM531Cxu5LPLTav2JDkvmceK3yk2JqBZO5Xo3xf6gsGKJiV5NsHzIA
 ruK5PJUdavZwEFfFNVkHXo8dJC65+MPqDtnDChmkypFnCOaKMKWsxAzXlSr7O4Q/NlPYJpML89i
 WQavnroTbh30too9SvcXqjr0NTLqoqvs=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr4335343pjb.10.1637324606059; 
 Fri, 19 Nov 2021 04:23:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRUveOBZh9eDktsVizP0zH6wyJv82LSFo7WrIJeZwTIB7NG+ib/OoJ8630mvFotXjbpkQM6YvlOZUMXpJW5hQ=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr4335296pjb.10.1637324605759; 
 Fri, 19 Nov 2021 04:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-3-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-3-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 09:22:59 -0300
Message-ID: <CAKJDGDZnTCT=jm7hakHYO4BxED4k=nYthwmh-hGe2He37pAWSA@mail.gmail.com>
Subject: Re: [PATCH 2/7] python/machine: remove _remove_monitor_sockfile
 property
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 18, 2021 at 5:49 PM John Snow <jsnow@redhat.com> wrote:
>
> It doesn't matter if it was the user or the class itself that specified
> where the sockfile should be created; the fact is that if we are using a
> sockfile here, we created it and we can clean it up.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


