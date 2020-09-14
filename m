Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D06E2684B2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 08:19:47 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHhq6-0005c7-HD
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 02:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHhhL-0002Pb-Nk
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:10:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40985
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHhhI-0002p1-Ej
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600063837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xwQQxWWi6fWEkVAhVZpRugVE33fNVOlSbnOzrI36o0=;
 b=YAaR/G8ZDRM0od96XQr7DWV+JJwqIoitjFryszVPm1ZbzPEgzlauexi4e46mGp8vzlwgWN
 dQ+wGV/KoVbuJ6r2Y+Kp0eUhelifd1jAXVJbn/8rk9uR7ouiG0qO0LTwUwB5fwU3T6nRIJ
 PT6G21+2+MUUgnne/JWlfCdKL5q1GHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-eVZ9FsGCOqycOicWHmmOng-1; Mon, 14 Sep 2020 02:10:34 -0400
X-MC-Unique: eVZ9FsGCOqycOicWHmmOng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 558C510BBECA;
 Mon, 14 Sep 2020 06:10:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E4825C6C0;
 Mon, 14 Sep 2020 06:10:25 +0000 (UTC)
Subject: Re: [PATCH v8 00/27] W32, W64 msys2/mingw patches
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200912224431.1428-1-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <276a137d-d863-2465-1fe2-599e5772a1a8@redhat.com>
Date: Mon, 14 Sep 2020 08:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 00:11:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2020 00.44, Yonggang Luo wrote:
> It first introduce msys2 CI on cirrus by fixes nfs, capstone, curses and
> disable partial test-char tests.
> And then fixes all unit tests failure on msys2/mingw
> This fixes the reviews suggested in the mailling list
> All cirrus CI are passed

 Hi,

since you're very often sending new versions of your patch series, could
you please add a history to the cover letter to say what you changed in
each version? Otherwise, your work is very hard to follow.
I'd also suggest to really slow down the sending a little bit. Let your
patches mature in your tests first, then send out a new series only if
you feel that they are really ready. Nobody has the bandwith to review a
patch series with 27 patches each day...

 Thanks,
  Thomas



