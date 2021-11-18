Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAB455C02
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:56:38 +0100 (CET)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngxx-0001nI-3P
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mngwP-0000MC-Qj
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:55:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mngwM-0003iJ-AX
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637240096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOeYgcRTJTe5MmpOAxNCJtzjIA2s6oLw67J8Ywg8nPs=;
 b=QdiQLSuqaOUzFukqf+9GLXh7SmwgbpyNJa5GuyQZ/eHjyhZJpRj85ZJfyOyB2+n2Yhry8N
 xthnBnbtvkwlUhBV5Nri4O8omipHR1/qcFJzU2YuE4NW5/DC2AOKyIzeX+CuFQB+3+NjC0
 z1TRvF9IlUhhlOwtAKfRUWmRa4zGsKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-7bQZ4IoWN82-I6dAExyVgw-1; Thu, 18 Nov 2021 07:54:53 -0500
X-MC-Unique: 7bQZ4IoWN82-I6dAExyVgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2516102CB76;
 Thu, 18 Nov 2021 12:54:52 +0000 (UTC)
Received: from [10.39.194.89] (unknown [10.39.194.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F8E1B5B7;
 Thu, 18 Nov 2021 12:54:40 +0000 (UTC)
Message-ID: <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
Date: Thu, 18 Nov 2021 13:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118122912.4051779-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211118122912.4051779-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Thomas Markey <admin@fosshost.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2021 13.29, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors.
> 
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
...
> +QEMU has sponsors!
> +
> +For continuous integration and testing, hardware is provided by:
> +- [Fosshost](https://fosshost.org/)

Are we finally using the server now? ... the last time I asked, it was just 
idle and we talked about returning it?

  Thomas


