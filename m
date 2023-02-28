Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F146A55CD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwKf-0005cF-Ez; Tue, 28 Feb 2023 04:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pWwJx-0005Xk-MJ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pWwJv-0001i5-Uc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677576651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZZ2KcU5dEy29DOBm6Y9voeuOeIMZA9HbAugMXDVknI=;
 b=iE56kbQHS1hR0lDxVJawou8S0cY6EaZAYVeARXaL78OQiB0wvB9iI5zaIz3HJXRmObdwx1
 GLHCpYbwHnPbiYN5MSP/rm7QMwWLbiI559OFXdidhsfIlZOYH/lrPpVyNztR8oWxcfB6UD
 eosLga3q/9Qv8wyKo2yEebnizzNIKPE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538--GTAY8JtMWulcnXLnFTZEA-1; Tue, 28 Feb 2023 04:30:50 -0500
X-MC-Unique: -GTAY8JtMWulcnXLnFTZEA-1
Received: by mail-qv1-f71.google.com with SMTP id
 u18-20020a0cec92000000b0056ea549d728so4858781qvo.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 01:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZZ2KcU5dEy29DOBm6Y9voeuOeIMZA9HbAugMXDVknI=;
 b=i/7q8eFoEqw/kXhNQ3Jwr8Ewg3e7t/zCdXX6TPGtaOO6h1/cUZseXhOjAsjaq8qXd1
 dhxz+Ol+FyDrgVTebCDhurRS/P/JlNW6d3wDVlwme1oCziJANb1hatB+iV/34vIBBNo4
 EL3/ZIzmXC7rbDl6JJZbm8TXJ6phehBw1eaSLqUVanXN6WwTvUBj+TpAh0GAa11QLn6M
 EOhNdNZaG0ylRGAnKLWWnaOdKqYpT9tYyj5aRxa53Fyaf0VNzTOgcq71N7/pFhx7DZN2
 +IpSY+8wDWqwDv0+UJI62USnQTQ55FMV3dqnsxqoQP4y7H9z3dBjmLWUkAE4HdwwHJqC
 XAUQ==
X-Gm-Message-State: AO0yUKURv4HKhUXBouUO6Gc28d+/nAX3isUVzrgc5xG1Cloc6kjM13Rd
 RpUixapp5blHzw0Blk+zG26bzbgu8beAZp/l8rTYWzsaxWQQLbHhRHIN1BJGPoObxFCiTVShaur
 Id5yb8xlPMIwpORY=
X-Received: by 2002:a05:622a:451:b0:3bf:a030:2e50 with SMTP id
 o17-20020a05622a045100b003bfa0302e50mr3673353qtx.64.1677576649643; 
 Tue, 28 Feb 2023 01:30:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8ewzhAUCWXoBJP+p7brjAKdXGqeU9SbgvjR8NA5SWT1OQizZ3d45YSIyKtQDD3zT53gdjlcQ==
X-Received: by 2002:a05:622a:451:b0:3bf:a030:2e50 with SMTP id
 o17-20020a05622a045100b003bfa0302e50mr3673281qtx.64.1677576648367; 
 Tue, 28 Feb 2023 01:30:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r3-20020ac87943000000b003b9b48cdbe8sm6106863qtt.58.2023.02.28.01.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 01:30:47 -0800 (PST)
Message-ID: <904cf89a-64b0-5b87-e7b7-c759e9facd3c@redhat.com>
Date: Tue, 28 Feb 2023 10:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] test-vmstate: fix bad GTree usage, use-after-free
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, dgilbert@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, rjones@redhat.com, marcandre.lureau@redhat.com,
 armbru@redhat.com, philmd@linaro.org
References: <20230228090352.339466-1-eric.auger@redhat.com>
 <Y/3FeKPQYJzVl/uH@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y/3FeKPQYJzVl/uH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

On 2/28/23 10:12, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 10:03:52AM +0100, Eric Auger wrote:
>> According to g_tree_foreach() documentation:
>> "The tree may not be modified while iterating over it (you can't
>> add/remove items)."
>>
>> Since glib2 has removed its custom slice allocator and has switched
>> to using system malloc, a SIGSEGV can be observed while running
>> test-vmstate. With glibc + MALLOC_PERTURB_, malloc is able to detect
>> this kind of bugs. The relevant glib2 change that causes the problem
>> is:
> IMHO this somewhat reads like we're blaming glib2 for a causing
> a bug in our own code. Can we change that paragraph to something
> more like
>
>   By missing the requirement to not modify the tree, the QEMU
>   test case has been using memory after it was freed. Historically
>   GLib2 used a slice allocator for the GTree APIs which did not
>   immediately release the memory back to the system allocator.
>   As a result QEMU's use-after-free bug was not visible. With
>   GLib > 2.75.3, the slice allocator has been removed, such that
>   all allocations/frees are directly handled by the system
>   allocator, exposing the problematic iteration code.

agreed. Changed the wording in the commit message.

Thanks

Eric
>
>> https://gitlab.gnome.org/GNOME/glib/-/commit/45b5a6c1e56d5b73cc5ed798ef59a5601e56c170
>>
>> Get rid of the node removal within the tree traversal. Also
>> check the trees have the same number of nodes before the actual
>> diff.
>>
>> Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1518
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Richard W.M. Jones <rjones@redhat.com>
>> Tested-by: Richard W.M. Jones <rjones@redhat.com>
>> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - Enhance the commit message with Rich's explanations
>>
>> v1 -> v2:
>> - respin of Marc-André's patch from Aug 2020, which can be
>> found at
>> https://lore.kernel.org/qemu-devel/20200827161826.1165971-1-marcandre.lureau@redhat.com/
>> This fell through the cracks and now we hit a SIGSEGV
>> ---
>>  tests/unit/test-vmstate.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
>> index 79357b29ca..0b7d5ecd68 100644
>> --- a/tests/unit/test-vmstate.c
>> +++ b/tests/unit/test-vmstate.c
>> @@ -1073,7 +1073,6 @@ static gboolean diff_tree(gpointer key, gpointer value, gpointer data)
>>      struct match_node_data d = {tp->tree2, key, value};
>>  
>>      g_tree_foreach(tp->tree2, tp->match_node, &d);
>> -    g_tree_remove(tp->tree1, key);
>>      return false;
>>  }
>>  
>> @@ -1082,9 +1081,9 @@ static void compare_trees(GTree *tree1, GTree *tree2,
>>  {
>>      struct tree_cmp_data tp = {tree1, tree2, function};
>>  
>> +    assert(g_tree_nnodes(tree1) == g_tree_nnodes(tree2));
>>      g_tree_foreach(tree1, diff_tree, &tp);
>> -    assert(g_tree_nnodes(tree1) == 0);
>> -    assert(g_tree_nnodes(tree2) == 0);
>> +    g_tree_destroy(g_tree_ref(tree1));
>>  }
>>  
>>  static void diff_domain(TestGTreeDomain *d1, TestGTreeDomain *d2)
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>
> With regards,
> Daniel


