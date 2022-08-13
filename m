Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5F591BF7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:15:58 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtnp-0005Tw-Qz
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oMtGx-0001rb-5o
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 11:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oMtGu-0007OI-VC
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 11:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660405316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOAicgu1bJ77tfODvLWc6FNds0HQquOFKFpVUlI1/18=;
 b=R2DLaJMlnlkUaOugOFinpf6Ad9PARdqaAh/PmmiSDh5FpjLpVkP8M0k2ruWrgQNL2Nk7Ah
 copyEkXEFq22KKOXcpTRnR5TTblDWQz4Uc2+V2/y1e/ne7pawKfsjlB17YzQlr6Z1lA9rt
 iNDUelGosU2MFOrpAoYnmKS3FvKYaY8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-1ymoXcUNPcKU6yzN9--jTA-1; Sat, 13 Aug 2022 11:41:54 -0400
X-MC-Unique: 1ymoXcUNPcKU6yzN9--jTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 9-20020a1c0209000000b003a53ae8015bso6031388wmc.1
 for <qemu-devel@nongnu.org>; Sat, 13 Aug 2022 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=ZOAicgu1bJ77tfODvLWc6FNds0HQquOFKFpVUlI1/18=;
 b=SfS6dca9Jy9Kp/B8zdrKGh2cnvy0dHZnVKVkGCfR7uFDi6C3tLUhcH6B8jaN3udAkB
 Wz6LNBou03fWqLPQz0sc/iOHQFcNNmKODfMWQbftyZ7uGlh/ybOma33HTvcrZU1pQjdc
 77Xq5okllsq+eKB56BgEkLiQZhh4404mmUn8sd7Pkvsm9AzKv7XMQzHnywKvH06wz4y2
 4ZEZfC//Z+4lj+sQFbchha3z4pNBOSH6lvMLimkiGPGKDwMPUEPWakk79VbYPcvVDEYn
 qgHZ6tmR0oEq+MzyGQPWBGko+G4fs7dkAcNcwZDEWYzIqyKzAjWcXLVL/urYzlA3KzZI
 FpZA==
X-Gm-Message-State: ACgBeo07jcLwGwuvSkYZ1EWBzTN4E4OWNVAjwjH2o3D6bPQSptfjb57o
 LDXkN52gHNTs1d7+1uRKocfoYG3GZBVnpKUHIqLShHcpR4UpdOPF19/205LrhAEXSNEgj4Nyc2s
 YiQpXHXrMN827LJM=
X-Received: by 2002:a05:600c:5108:b0:3a5:c1b5:ba88 with SMTP id
 o8-20020a05600c510800b003a5c1b5ba88mr7718122wms.204.1660405313654; 
 Sat, 13 Aug 2022 08:41:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ZZ2Tr1KNfUWn8vWvbb9tnzW49WaA5c+vp3If6kUubdEQPRoQpR27evvEk7mKCrg3IgM7VLQ==
X-Received: by 2002:a05:600c:5108:b0:3a5:c1b5:ba88 with SMTP id
 o8-20020a05600c510800b003a5c1b5ba88mr7718103wms.204.1660405313330; 
 Sat, 13 Aug 2022 08:41:53 -0700 (PDT)
Received: from localhost ([178.139.230.247]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5551000000b0021f0af83142sm2277178wrw.91.2022.08.13.08.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 08:41:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 01/12] multifd: Create page_size fields into both
 MultiFD{Recv,Send}Params
In-Reply-To: <7b781bcb37cda71e3cd19364940719f832573462.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 05:10:51
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-2-quintela@redhat.com>
 <7b781bcb37cda71e3cd19364940719f832573462.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Sat, 13 Aug 2022 17:41:51 +0200
Message-ID: <87v8qwdubk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> Hello Juan,
>
> On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
>> We were calling qemu_target_page_size() left and right.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> IMHO looks a good idea to bring that info inside the multifd parameters.

Thanks.

[...]

> IIUC this info should never change after assigned, and is the same on eve=
ry
> multifd channel param.=20

registered_yank?  Perhaps, I have to look.

packet_len, page_size, page_count and write_flags: They never really change.

But on the other hand, So we are "wasting" 16bytes per channel.

> I wonder if it would be interesting to have a common area for this kind o=
f info,
> which could be referenced by every multifd channel parameter.
> Or maybe too much trouble?

Will take a look on the future, the bigger problem that I can think of
is that we are already passing the MultiFD{Send,Recv}Params to each
function, so having them globaly will means to have global variable or
adding a pointer (8bytes) to each params, so not sure it is a good idea
with current amount of constants.

> Anyway, FWIW:
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

thanks, Juan.


