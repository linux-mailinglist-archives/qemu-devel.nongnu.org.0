Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A324C5CB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 20:45:35 +0200 (CEST)
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8pZ8-0007jq-Dv
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 14:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k8pUk-0001bX-0P
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 14:41:02 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k8pUe-0003Se-5r
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 14:41:01 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkIEJ-1kXCsS3yFl-00kiT1; Thu, 20 Aug 2020 20:40:50 +0200
Subject: Re: [PATCH v2 44/58] qom: provide convenient macros for declaring and
 defining types
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-45-ehabkost@redhat.com>
 <20200820174506.GE642093@habkost.net>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3cbd1150-3b91-3213-7e42-6f01f45a511e@vivier.eu>
Date: Thu, 20 Aug 2020 20:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820174506.GE642093@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tg3WslglKDK1BihjHiiqs+IAiJQDIR6vCgnt3Lh+d/053aad7qT
 Lh90b1HFH8QahNJYQB8DbylYKrd54HrrZB8kjlMSEYMVols8OWNwi/z12QWtUxvEs0iXByi
 uma1o9QBg9l5SCWMv0SJfp+OcuszKAYUnb0K2lI9QAHo+qQ2wz0SyAivhT+ycAd4sFoaEBW
 XsAbeOiDJ9totZPxfqP6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AjsjG4l9mfc=:Q8a60narI+JV+jaAJJlwVJ
 zDbYJDGbotf6CqamSZfs8kypLjUUDASxJ4kSRns6K5G9G2RnOkYG1Axe6VLrH0d0BZqtzRRdM
 /vSUlpUj2bFZWS+rSCu+VEK8LYTPPlzzQ1TjLpAvUJNYWg82oSbRYMQeGKplGbHLhJ5zI6xyc
 A2LP22D5yCQ2V0zhIrKoQ+T7vvj6fadTSGGJDPBMK842ymiP2+j8wfpXIUEnkeKtzwzkKcNAU
 fGicrJkkWkHychza2AC73NSFLCW2K5IcZznT9V5ubXIY+rPwp3lOBbdjmWiMSxzQyPeANIcPQ
 O4cakuUJhmZFU3UUPfoGVt6/dXYPolRH7t1JHuq6ml0McgMCDF6IQfnmFXBCl5SSuIL3cPR9H
 fD1rsI7+6tVQ67LFus7rtkYD6VDwN+Rsl6jHpPI2S6F4Wjd1D1aUrh34OkNWnKHc8sBiiKtM8
 oVXET3VWofQnHXOx4/IVoO89WFJoWTuLilR5JcDPET0oIjAmQBz1Kuie5SUNDy27zw9uMbyu8
 T9JKcH+yzvzZfaebUNx1awTqrNXmv7ImC+IRlkE1ylfg4YMgjuODXqgg9xJutUkxT9JrjuUVq
 v+5vFhK+uE6uFMzLccX49eHTw5tKZGkivdwENy8WXWyqAWslXhy16j9Sj5ZSqesaIiCcA1WTj
 +PrQSayFQISkDZBuG/nEUM2cfKEu0ElvZfvgUmzUlU0xVDIwc7bDVluja3VsUuQGfxgqV8hBg
 aqrrwZtlP48XprSffAU9hv1YYwp76G5o6PcZ8i/IVO9RQHCHWLG0mlMl3OiLee5bXBaSY9NMt
 duc+1CBn8TVUaRsDFkggwLvwEiGfJfnGujTO/WRu1dIOgcLyZmL+otCGvCFp+6UHmSAkoF+
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 14:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/08/2020 à 19:45, Eduardo Habkost a écrit :
> (CCing Eric Blake, who reviewed the original patch.  Sorry for
> not CCing you previously, Eric)
> 
> On Wed, Aug 19, 2020 at 08:12:22PM -0400, Eduardo Habkost wrote:
> [...]
>> +/**
>> + * OBJECT_DECLARE_TYPE:
>> + * @ModuleObjName: the object name with initial capitalization
>> + * @module_obj_name: the object name in lowercase with underscore separators
>> + * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
> 
> We need to decide what to do with TYPE_SWIM:
> 
>   #define TYPE_SWIM "swim"
>   typedef struct SWIM SWIM;
>   #define SWIM(obj) OBJECT_CHECK(SWIM, (obj), TYPE_SWIM)
> 
> Both the typedef and type checking macros are called "SWIM".
> This makes usage of OBJECT_DECLARE_TYPE impossible (because the
> type checking function can't have the same as the typedef).  What
> should be the recommended style here?  Rename the struct to
> "Swim"?

"Swim" looks good to me.

Thanks,
Laurent

