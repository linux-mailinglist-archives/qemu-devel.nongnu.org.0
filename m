Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1137CCF2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:07:23 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsKQ-00018M-Eg
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgsI6-0007se-7h
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgsI0-0000dK-8x
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERYaULSt8FVoz/4iqaXcIbfipXk6zUrfFWcdyB9JlNk=;
 b=URqN2N23MshN6nzc/tOxzLYLauc23sEMoVEJYhgkda4g8QQtoy+WjQMQqe4Ow5sIcma8mb
 6Nfg8BJG3RZ6cUkCzqVVtjQavJgrKnjgr0l9Gz7I5eDGekCo+TSZ38MNF/Gl1Q3YCgc1kW
 7VjIWuiWJtb9rAlEIfrXarJiFLwiJ9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-xWDG7gqkPW6Y_0sSFR51Eg-1; Wed, 12 May 2021 13:04:47 -0400
X-MC-Unique: xWDG7gqkPW6Y_0sSFR51Eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB225801817;
 Wed, 12 May 2021 17:04:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-121.ams2.redhat.com
 [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D96445C8AA;
 Wed, 12 May 2021 17:04:45 +0000 (UTC)
Subject: Re: [PATCH v2] qemu-iotests: fix pylint 2.8 consider-using-with error
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210510190449.65948-1-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d2253d8d-89dd-1acf-e005-0fb3aee6610d@redhat.com>
Date: Wed, 12 May 2021 19:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190449.65948-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.05.21 21:04, Emanuele Giuseppe Esposito wrote:
> pylint 2.8 introduces consider-using-with error, suggesting
> to use the 'with' block statement when possible.
> 
> Modify all subprocess.Popen call to use the 'with' statement,
> except the one in __init__ of QemuIoInteractive class, since
> it is assigned to a class field and used in other methods.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v1 -> v2:
> * fix indentation [Max]
> * explain why we disabled the check in QemuIoInteractive's __init__ [Max]

Thanks!

Applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


