Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D9572757
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:34:30 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMaU-00084q-2w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUe-0005BL-Pv; Tue, 12 Jul 2022 16:28:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUd-0004q2-84; Tue, 12 Jul 2022 16:28:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id a5so12737367wrx.12;
 Tue, 12 Jul 2022 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W9YnMTm4KQVfXFw96DY2vqBiBt5aZrVruQ2F7I8t9nE=;
 b=G6y+tRPf7xPUv0nP0Kbk7DcgMELlTXAfePcwTlxvQArVz0lQqBUsJ1yb2rUysPtYCs
 KZQtvJ0RBQDvpoatD/eYHHEV0TkcDG5RSRRUlevNbRJr75Q0A0iUZLPlgA2hC7hn5c76
 0m3aY3D36TfH/utD1FwG4mndkcseynfKDdAWKJFKc5PPVHl3Vd3SyEt0xiltIuy+XhCt
 IgvntjbonKhEsIsOjhuRZScYj1aeKYwPBeEJn019YsbTi+22dPyAdxjPLigeonUa+YkY
 rHgM/yBX7oSkxGPY0fMDlrln6+Br2t4k8F8VANjdl7GnJiGingRCxjcEG0J2I3faeAb1
 cPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W9YnMTm4KQVfXFw96DY2vqBiBt5aZrVruQ2F7I8t9nE=;
 b=clxAkuB+UoML2AQbvXDuqP3hOzGHdNP1lNnUP7Pdwg+5Jg4WVbehQBVh+rcANk1Aoy
 2i1JeBiDgaiFyH9/wBhd1kGJ+HdWL6Art+jrXEWtms4VvW6TJQhoY2eGPZdjwA6d7VxC
 J4gR8aANI5zQQJ0q9NZWHEm6Davv368BPH+RZzSCmhh4yCtBeXO+K4YGnTEtag8vSUSu
 301fcfVbAv5CtD0SYFTA5YL+qrkOS+IVCUNe2x66/6AI34OVsfCRXL9rKfBKq7I+cyGo
 32mE5u9X6zAnoV9GPs2rn+loJC96nbXYc1ZisZyj9zF8rvUwRwUmD2umSLKiTQ/NnbVA
 tFEQ==
X-Gm-Message-State: AJIora+ZOI0Ee8uxj1FzSONl+u2/wOYtGxQGc+IGaQUYRCgmybRjrpml
 2Ol8VTnj4p53EsienmQtXqvfhbmiZj9GOBWW
X-Google-Smtp-Source: AGRyM1uUP+SPl9xBJtV+UqpJRpOjL+vCxYBUFpxR72VfGSwBRCUfwBmoqgSgfRo6ey9LSXEzwvaslA==
X-Received: by 2002:a05:6000:81e:b0:21d:8811:777b with SMTP id
 bt30-20020a056000081e00b0021d8811777bmr24020366wrb.647.1657657705692; 
 Tue, 12 Jul 2022 13:28:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a17ab4e7c8sm14235580wmp.39.2022.07.12.13.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:25 -0700 (PDT)
Message-ID: <ba682c99-de50-eea9-1ade-89aba0a54388@amsat.org>
Date: Tue, 12 Jul 2022 22:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as Guest Agent reviewer
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220712092715.2136898-1-kkostiuk@redhat.com>
In-Reply-To: <20220712092715.2136898-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/7/22 11:27, Konstantin Kostiuk wrote:
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 450abd0252..b1e73d99f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git qapi-next
>   
>   QEMU Guest Agent
>   M: Michael Roth <michael.roth@amd.com>
> +R: Konstantin Kostiuk <kkostiuk@redhat.com>
>   S: Maintained
>   F: qga/
>   F: docs/interop/qemu-ga.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

