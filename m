Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A4E269224
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 18:52:53 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHrim-0006Kk-Aw
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 12:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kHrh9-0004yS-PQ
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:51:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:59222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kHrh8-0001mA-1b
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:51:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12BD5B07D;
 Mon, 14 Sep 2020 16:51:24 +0000 (UTC)
Subject: Re: [PATCH v2] tests/qtest/qmp-cmd-test: Use inclusive language
To: Thomas Huth <thuth@redhat.com>
References: <20200914163755.42618-1-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <db2a53e2-f976-2a68-3039-d119fa41405a@suse.de>
Date: Mon, 14 Sep 2020 18:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914163755.42618-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:18:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems to me that "blacklist" is a very commonly used technical term,
and expresses the concept more precisely.

I am not sure what "inclusive language" is or what relationship it has with technical work on QEMU.

Thanks,

Claudio

On 9/14/20 6:37 PM, Thomas Huth wrote:
> We simply want to ignore certain queries here, so let's rather
> use the term 'ignore' to express this intention.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Changed naming according to suggestions
> 
>  tests/qtest/qmp-cmd-test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 3109a9fe96..8a4c570e83 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -82,9 +82,9 @@ static void test_query(const void *data)
>      qtest_quit(qts);
>  }
>  
> -static bool query_is_blacklisted(const char *cmd)
> +static bool query_is_ignored(const char *cmd)
>  {
> -    const char *blacklist[] = {
> +    const char *ignored[] = {
>          /* Not actually queries: */
>          "add-fd",
>          /* Success depends on target arch: */
> @@ -101,8 +101,8 @@ static bool query_is_blacklisted(const char *cmd)
>      };
>      int i;
>  
> -    for (i = 0; blacklist[i]; i++) {
> -        if (!strcmp(cmd, blacklist[i])) {
> +    for (i = 0; ignored[i]; i++) {
> +        if (!strcmp(cmd, ignored[i])) {
>              return true;
>          }
>      }
> @@ -179,7 +179,7 @@ static void add_query_tests(QmpSchema *schema)
>              continue;
>          }
>  
> -        if (query_is_blacklisted(si->name)) {
> +        if (query_is_ignored(si->name)) {
>              continue;
>          }
>  
> 


